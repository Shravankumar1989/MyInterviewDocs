#!/bin/bash
n=10
for((i=1;i<=$n;i++)); do
    if [ $((i%2)) == 0 ]; then
        echo "${i}"
    fi
done