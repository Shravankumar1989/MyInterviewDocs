#!/bin/bash

read -p "enter two numbers: " number1 number2
read -p "enter bitwise operator: " operator

case $operator in
    AND)
        echo "Result: $number1 & $number2 = $((number1&number2))";;
    OR)
        echo "Result: $number1 | $number2 = $((number1|number2))";;
    NOT)
        echo "Result: $number1 ^ $number2 = $((number1^number2))";;
    *)
        echo "Invalid operator.";;
esac