#!/bin/bash

USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
echo $USAGE