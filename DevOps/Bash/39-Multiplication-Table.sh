#!/bin/bash

read -p "Enter a number: " num
n=10
for((i=1;i<=$n;i++)); do
    echo " $num X ${i} = $(($num*i))"
done