#!/bin/bash

if [ -w "11-variable.sh" ]; then
    echo "File is writeable"
else
    echo "File is not writeable"
fi