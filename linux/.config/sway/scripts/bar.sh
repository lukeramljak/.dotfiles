#!/bin/bash

while true
do
    disk=$(df -h / | awk 'NR==2{print $5}')
    vol=$(pamixer --get-volume)
    date=$(date +'%Y-%m-%d %I:%M:%S %p')

    echo "disk: $disk | vol: $vol% | $date |"
    sleep 1
done
