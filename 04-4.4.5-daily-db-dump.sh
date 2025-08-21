#!/bin/bash
# Dumps MySQL database for daily backup
DB="production_db"
USER="root"
PASS="yourpassword"
BACKUP_DIR="/opt/db_backups"
mkdir -p $BACKUP_DIR
mysqldump -u $USER -p$PASS $DB > $BACKUP_DIR/${DB}_$(date +%F).sql
