#!/bin/bash

# Variables
DB_NAME="your_database_name"
DB_USER="your_db_user"
DB_PASS="your_db_password"
BACKUP_DIR="/path/to/backup"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-backup-$DATE.sql"
LOG_FILE="$BACKUP_DIR/backup_log.txt"

# Ensure backup directory exists
mkdir -p $BACKUP_DIR

# Create a backup using mysqldump
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Starting backup for $DB_NAME..." >> $LOG_FILE
mysqldump -u $DB_USER -p $DB_PASS $DB_NAME > $BACKUP_FILE

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Backup successful: $BACKUP_FILE" >> $LOG_FILE
else
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Backup failed for $DB_NAME" >> $LOG_FILE
    exit 1
fi

# Optionally, compress the backup
gzip $BACKUP_FILE

# Delete old backups (older than 30 days)
find $BACKUP_DIR -type f -name "*.gz" -mtime +30 -delete

# Log completion
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Backup and cleanup complete." >> $LOG_FILE