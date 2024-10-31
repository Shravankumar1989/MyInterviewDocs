#!/bin/bash

file="Array.sh"

# Check if the file is a file
if [ -f "$file" ]; then
    echo "$file is a file."
else
    echo "$file is not a file."
fi 