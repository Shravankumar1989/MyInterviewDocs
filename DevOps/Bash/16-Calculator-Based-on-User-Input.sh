#!/bin/bash

read -p "Enter the first number: " number_1
read -p "Enter the second number: " number_2
read -p "Enter the operator like +,-,*,/: " operator

if [[ $operator == "+" ]]; then
    echo "Addition : $(($number_1 + $number_2))"
elif [[ $operator == "-" ]]; then
    echo "Subtraction : $(($number_1 - $number_2))"
elif [[ $operator == "*" ]]; then
    echo "Multiplication : $(($number_1 * $number_2))"
elif [[ $operator == "/" ]]; then
    echo "Division : $(($number_1 / $number_2))"
else
    echo "Invalid operator : $operator"
fi