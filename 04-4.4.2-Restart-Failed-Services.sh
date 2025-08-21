#!/bin/bash
# Restarts failed systemd services
for service in $(systemctl --state=failed | awk 'NR>1 {print $2}'); do
  echo "Restarting $service..."
  sudo systemctl restart "$service"
done
