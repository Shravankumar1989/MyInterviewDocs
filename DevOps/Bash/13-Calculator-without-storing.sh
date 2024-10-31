#!/bin/bash

read -p "Enter the first value : " number_1
read -p "Enter the second value : " number_2

echo "Addition $(($number_1+$number_2))"
echo "Substraction $(($number_1-$number_2))"
echo "Multiplication $(($number_1*$number_2))"
echo "Division $(($number_1/$number_2))"