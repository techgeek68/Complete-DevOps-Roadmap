#!/usr/bin/env bash
# Restarts failed systemd services (robust parsing; ignores the "●" marker).
# Run as root to avoid repeated sudo prompts, or keep sudo if running as a normal user.
set -euo pipefail

echo "Checking for failed services..."

# Find tokens that end with .service (ignores the bullet '●' token)
systemctl --failed --no-legend --no-pager --type=service \
  | awk '{ for (i=1; i<=NF; i++) if ($i ~ /\.service$/) print $i }' \
  | while read -r service; do
    [ -z "$service" ] && continue

    echo "Restarting $service..."
    if sudo systemctl restart "$service"; then
      echo "OK: $service restarted."
    else
      echo "ERROR: failed to restart $service" >&2
    fi
done
