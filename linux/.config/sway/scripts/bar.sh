#!/bin/bash

disk=$(df -h / | awk 'NR==2{print $5}')
vol=$(pamixer --get-volume)
default_sink=$(pactl get-default-sink)
output=$(pactl list sinks | grep -A1 "Name: $default_sink" | grep 'Description' | cut -d ':' -f2 | xargs)
date=$(date +'%Y-%m-%d %I:%M:%S %p')

echo "disk: $disk | vol: $vol% | $output | $date "
