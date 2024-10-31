#!/bin/bash
# -e - backslash-escaped characters
read -p "Enter the string: " string
toLower=$(echo -e "${string}" | tr '[:upper:]' '[:lower:]')
echo "toLower : $toLower"