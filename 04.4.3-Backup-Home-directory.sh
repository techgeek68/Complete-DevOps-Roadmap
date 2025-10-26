#!/usr/bin/env bash
# Show current disk space and create a compressed tarball backup of a directory.
# Usage:
#   ./home_backup.sh                 # backup /home -> /opt/backups, keep 7
#   ./home_backup.sh /data /mnt/bkp 30
set -euo pipefail

# Defaults
SRC_DIR="${1:-/home}"
BACKUP_DIR="${2:-/opt/backups}"
RETENTION="${3:-7}"   # keep last N backups

# Basic checks
command -v tar >/dev/null || { echo "tar is required but not found" >&2; exit 2; }
mkdir -p -- "$BACKUP_DIR"
# lock file to prevent concurrent runs
LOCKFILE="$BACKUP_DIR/.backup.lock"
exec 200>"$LOCKFILE"
flock -n 200 || { echo "Another backup is running (lock $LOCKFILE). Exiting." >&2; exit 3; }

# Prepare names
SRC_DIR="$(cd -- "$(dirname -- "$SRC_DIR")" && pwd)/$(basename -- "$SRC_DIR")"  # normalize path
SRC_BASE="$(basename -- "$SRC_DIR")"
TIMESTAMP="$(date +%F_%H%M%S)"
TMP_FILE="$BACKUP_DIR/${SRC_BASE}_backup_${TIMESTAMP}.tar.gz.part"
FINAL_FILE="$BACKUP_DIR/${SRC_BASE}_backup_${TIMESTAMP}.tar.gz"

echo "Backing up $SRC_DIR -> $FINAL_FILE"
echo "Current disk usage before backup:"
df -h "$(dirname -- "$BACKUP_DIR")" || df -h "$BACKUP_DIR" || true
echo

# Create compressed tarball into temporary file, writing from the parent dir so paths are stable
PARENT_DIR="$(dirname -- "$SRC_DIR")"
pushd -- "$PARENT_DIR" >/dev/null
if tar --create --gzip --preserve-permissions --one-file-system --warning=no-file-changed --file="$TMP_FILE" "$(basename -- "$SRC_DIR")"; then
  mv -- "$TMP_FILE" "$FINAL_FILE"
  chmod 640 -- "$FINAL_FILE" || true
  echo "Backup completed: $FINAL_FILE"
  ls -lh -- "$FINAL_FILE"
else
  echo "Backup failed; removing partial file." >&2
  rm -f -- "$TMP_FILE"
  popd >/dev/null
  exit 4
fi
popd >/dev/null

# Rotation: keep only $RETENTION newest backups for this source
if [[ "$RETENTION" =~ ^[0-9]+$ ]] && [ "$RETENTION" -gt 0 ]; then
  echo "Applying retention: keeping $RETENTION backups for $SRC_BASE"
  # list files sorted by modification time, remove older ones
  IFS=$'\n' read -r -d '' -a old < <(ls -1t -- "$BACKUP_DIR"/"${SRC_BASE}_backup_"*.tar.gz 2>/dev/null || true; printf '\0')
  if [ "${#old[@]}" -gt "$RETENTION" ]; then
    for ((i=RETENTION; i<${#old[@]}; i++)); do
      echo "Removing old backup: ${old[i]}"
      rm -f -- "${old[i]}"
    done
  fi
fi

echo
echo "Current disk usage after backup:"
df -h "$(dirname -- "$BACKUP_DIR")" || df -h "$BACKUP_DIR" || true

# release lock (done automatically on exit), exit successfully
exit 0
