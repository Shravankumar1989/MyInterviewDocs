#!/bin/bash

# Define the service name
SERVICE_NAME="your_service_name"

# Check if the service is running
if systemctl is-active --quiet $SERVICE_NAME; then
    echo "$SERVICE_NAME is running."
else
    echo "$SERVICE_NAME is not running, attempting to start it..."
    
    # Try to start the service
    systemctl start $SERVICE_NAME
    
    # Check again if the service has started successfully
    if systemctl is-active --quiet $SERVICE_NAME; then
        echo "$SERVICE_NAME started successfully."
    else
        echo "Failed to start $SERVICE_NAME."
    fi
fi