#!/bin/bash
read -p "Enter the number: " number
if [ $((number%2))==0 ]; then
    echo "this even number $number"
else
    echo "this Odd number $number"
fi