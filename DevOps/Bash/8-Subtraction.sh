#!/bin/bash

read -p "Enter first number: " number1
read -p "Enter second number: " number2

substraction=$(($number1-$number2))

echo "Substraction: $substraction"