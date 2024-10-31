#!/bin/bash
n=10;
for((i=1;i<=n;i++)); do
    echo "${i}"
    touch "file-${i}".txt
done