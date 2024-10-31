#!/bin/bash

read -p "Please enter the postive or negative number: " number

if [ $number -gt 0 ]; then
    echo "positive number"
elif [ $number -le 0 ]; then
    echo "negative number"
else
    echo "Invalid number"
fi