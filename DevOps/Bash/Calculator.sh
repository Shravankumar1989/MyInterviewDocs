#!/bin/bash

set -euo pipefail

read -p "Enter the first number: " number1
read -p "Enter the second number: " number2
read -p "Enter the operator (+, -, *, /, %): " operator

case $operator in
    "*")
        multiplication=$(($number1 * $number2))
        echo "multiplication: $multiplication";;
    "+")
        addition=$(($number1 + $number2))
        echo "addition: $addition";;
    "-")
        substraction=$(($number1 - $number2))
        echo "substraction $substraction";;
    "/")
        division=$(($number1 / $number2))
        echo "division $division";;
    "%")
        reminder=$(($number1 % $number2))
        echo "reminder $reminder";;
    *)
        echo "Error: Invalid operator. Please use one of +, -, *, /, %."
        exit 1;;
esac