#!/bin/bash

# List of services to monitor
SERVICES=("nginx" "mysql" "apache2")

# Loop through each service and check its status
for SERVICE in "${SERVICES[@]}"; do
    # Check if the service is running
    if systemctl is-active --quiet $SERVICE; then
        echo "$SERVICE is running."
    else
        echo "$SERVICE is not running, attempting to start it..."
        
        # Try to start the service
        systemctl start $SERVICE
        
        # Check if the service started successfully
        if systemctl is-active --quiet $SERVICE; then
            echo "$SERVICE started successfully."
        else
            echo "Failed to start $SERVICE. Please check the logs."
        fi
    fi
done