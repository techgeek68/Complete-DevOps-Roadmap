#!/usr/bin/env bash
# Show current disk space and warn if usage exceeds a threshold (default 80%).
# Usage:
#   ./check_disk_space.sh        # uses default threshold 80
#   ./check_disk_space.sh 85     # warn when usage >= 85%

set -euo pipefail

THRESHOLD="${1:-80}"

echo "Current disk usage:"
df -h
echo

echo "Partitions at or above ${THRESHOLD}%:"
# Use POSIX-style output (-P) for more stable column positions, then parse percent and mountpoint.
df -P -h | tail -n +2 | awk '{print $5 " " $6}' | while read -r usep mount; do
  # remove trailing '%' from percent
  use=${usep%\%}
  # skip non-numeric values (just in case)
  if ! [[ "$use" =~ ^[0-9]+$ ]]; then
    continue
  fi
  if [ "$use" -ge "$THRESHOLD" ]; then
    printf 'Warning: %s is %s%% full.\n' "$mount" "$use"
  fi
done

exit 0
