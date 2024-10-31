#!/bin/bash

read -p "Enter a number: " num
n=10
for((i=n;i>=1;i--)); do
    echo " $num X ${i} = $(($num*i))"
done