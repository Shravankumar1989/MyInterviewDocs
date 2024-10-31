#!/bin/bash

myArray=("apple" "banana" "cherry")
for item in "${myArray[@]}"; do
    echo "${item}"
done
