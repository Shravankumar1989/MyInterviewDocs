#!/bin/bash

read -p "Enter the string : " strings
reversed=$(echo -e "${strings}" | rev)
echo "Reverse String: $reversed" 