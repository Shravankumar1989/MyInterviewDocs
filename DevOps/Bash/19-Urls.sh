#!/bin/bash

read -p "Please enter the correct URL: " URL

if [[ "$URL" =~ ^(http|https)://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(/.*)?$ ]]; then
    echo "Valid URL"
else
    echo "Invalid URL"
fi