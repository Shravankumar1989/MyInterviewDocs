#!/bin/bash

read -p "Enter first number: " number1
read -p "Enter Second number: " number2

addition=$(($number1+$number2))
substraction=$(($number1-$number2))
division=$(($number1-$number2))
reminder=$(($number1%$number2))

echo "this is addition $addition"
echo "Substraction: $substraction"
echo "division: $division"
echo "reminder: $reminder"