#!/bin/bash
# Simple backup of the /home directory
BACKUP_DIR="/opt/backups"
DATE=$(date +%F)
mkdir -p $BACKUP_DIR
tar czf $BACKUP_DIR/home_backup_$DATE.tar.gz /home
echo "Backup completed: $BACKUP_DIR/home_backup_$DATE.tar.gz"
