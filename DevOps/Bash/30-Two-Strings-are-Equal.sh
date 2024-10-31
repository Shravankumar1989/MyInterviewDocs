#!/bin/bash

read -p "Please Enter the First String: " string_1
read -p "Please Enter the Second String: " string_2 

if [ "$string_1" == "$string_2" ]; then
    echo "Both String are equal"
else
    echo "Both String are not equal"
fi