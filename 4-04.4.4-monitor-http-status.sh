#!/bin/bash
# Monitors HTTP status of a web server and sends an alert if not 200
URL="https://yourserver.com"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)
if [ "$STATUS" -ne 200 ]; then
  echo "Alert: $URL returned status $STATUS" | mail -s "Web Server Down" admin@example.com
fi
