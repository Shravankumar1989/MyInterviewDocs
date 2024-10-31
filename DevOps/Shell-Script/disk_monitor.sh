#!/bin/bash

# Set the threshold value (80% in this case)
THRESHOLD=80

# Set the email address for alerts
ALERT_EMAIL="your-email@example.com"

# Get the disk usage for each mounted filesystem
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $5 " " $1}' | while read output;
do
  # Extract the percentage value and the filesystem name
  usage=$(echo $output | awk '{print $1}' | sed 's/%//g')
  filesystem=$(echo $output | awk '{print $2}')
  
  # Check if the usage exceeds the threshold
  if [ $usage -ge $THRESHOLD ]; then
    echo "Warning: The $filesystem partition has used $usage% of its space." | 
    mail -s "Disk Usage Alert: $filesystem at $usage%" $ALERT_EMAIL
  fi
done