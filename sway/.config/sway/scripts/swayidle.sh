#!/usr/bin/env bash

exec swayidle -w \
  timeout 300 'swaylock -f -c 000000' \
	timeout 600 'swaymsg "output * power off"' \
		resume 'swaymsg "output * power on"'