#!/bin/bash

read -p "Enter first number: " number1
read -p "Enter second number: " number2

reminder=$(($number1%$number2))

echo "reminder: $reminder"