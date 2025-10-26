#!/usr/bin/env bash
# Monitor an HTTP(S) endpoint and alert if it's not returning HTTP 200.
# Usage:
#   ./monitor_http.sh [URL] [EMAIL] [RETRIES] [TIMEOUT]
# Examples:
#   ./monitor_http.sh "https://example.com" admin@example.com 3 5
# Defaults:
#   URL      = https://yourserver.com
#   EMAIL    = admin@example.com
#   RETRIES  = 3
#   TIMEOUT  = 5

set -euo pipefail

URL="${1:-https://yourserver.com}"
EMAIL="${2:-admin@example.com}"
RETRIES="${3:-3}"
TIMEOUT="${4:-5}"
SUBJECT="Web Server Alert: $URL"
SLEEP_BETWEEN=2

send_alert() {
  local body="$1"
  # Prefer mail if available, otherwise print to stderr
  if command -v mail >/dev/null 2>&1; then
    echo "$body" | mail -s "$SUBJECT" "$EMAIL"
  elif command -v mailx >/dev/null 2>&1; then
    echo "$body" | mailx -s "$SUBJECT" "$EMAIL"
  else
    # fallback: print the alert so a caller (or cron) can pick it up
    >&2 echo "$body"
  fi
}

check_once() {
  # Returns: 0 = OK (200), 1 = non-200 HTTP response, 2 = curl/network error
  # Outputs status and timing on stdout: "<http_code> <time_total>"
  local result
  # Use --max-time for timeout; -sS to show errors on stderr if any (we'll check exit code)
  result="$(curl -sS --max-time "$TIMEOUT" -o /dev/null -w "%{http_code} %{time_total}" -- "$URL" )"
  local rc=$?
  if [ $rc -ne 0 ]; then
    # curl failed (timeout, DNS, TLS, etc.)
    echo "CURL_ERROR"
    return 2
  fi
  echo "$result"
  local code="${result%% *}"
  if [ "$code" = "200" ]; then
    return 0
  else
    return 1
  fi
}

timestamp() { date -u +"%Y-%m-%dT%H:%M:%SZ"; }

# Try up to $RETRIES with small backoff
attempt=1
while [ $attempt -le "$RETRIES" ]; do
  out="$(check_once)" || rc=$? && true
  rc=${rc:-0}
  if [ "$rc" -eq 0 ]; then
    # OK
    http_code="${out%% *}"
    time_total="${out##* }"
    echo "$(timestamp) OK: $URL returned $http_code (time ${time_total}s)"
    exit 0
  elif [ "$rc" -eq 1 ]; then
    # non-200 response (out contains "CODE TIME")
    http_code="${out%% *}"
    time_total="${out##* }"
    echo "$(timestamp) WARNING (attempt $attempt/$RETRIES): $URL returned $http_code (time ${time_total}s)"
    # If more retries remain, sleep and retry
  else
    # curl/network error
    echo "$(timestamp) ERROR (attempt $attempt/$RETRIES): curl failed when contacting $URL"
  fi

  # Only send alert after last attempt failed
  if [ $attempt -lt "$RETRIES" ]; then
    sleep "$SLEEP_BETWEEN"
  fi
  attempt=$((attempt + 1))
done

# After retries, construct alert body and send
BODY="$(timestamp) ALERT: $URL is not healthy.
Attempted $RETRIES times with timeout ${TIMEOUT}s per try.
Last result: ${out}

Please investigate."
send_alert "$BODY"

exit 2
