#!/bin/bash
set -euo pipefail
read -p "Enter valid email id: " emailid
if [[ $emailid =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    echo "Print valid Email id"
else
    echo "Print invalid Email id"
fi