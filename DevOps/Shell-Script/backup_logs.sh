#!/bin/bash


# URL:- https://linuxsimply.com/100-shell-script-examples/


# Directory containing the log files
LOG_DIR="/path/to/logs"

# Backup directory
BACKUP_DIR="/path/to/backup"

# Number of days before logs are considered old
DAYS_OLD=7

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Find logs older than 7 days, move them to the backup directory, and compress them
find $LOG_DIR -type f -name "*.log" -mtime +$DAYS_OLD -exec mv {} $BACKUP_DIR \;

# Go to the backup directory and compress the moved log files
cd $BACKUP_DIR
find . -type f -name "*.log" -exec gzip {} \;

# Delete the original log files from the LOG_DIR after backup
find $LOG_DIR -type f -name "*.log" -mtime +$DAYS_OLD -delete

# Optional: clean up backups older than 30 days to save space
find $BACKUP_DIR -type f -name "*.gz" -mtime +30 -delete