#!/usr/bin/env bash

read -p "Enter the first string: " string1
read -p "Enter the second string: " string2
read -p "Enter the third string: " string3

sentence="$string1 $string2 $string3"
echo "Word to sentence $sentence"