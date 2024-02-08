#!/bin/bash

CURRENT_SINK=$(pactl get-default-sink)
SINK1_NAME="alsa_output.usb-SYC_SA9123_USB_Audio-01.analog-stereo"
SINK2_NAME="alsa_output.pci-0000_00_1f.3.analog-stereo"

if [ "$CURRENT_SINK" = "$SINK1_NAME" ]; then
    NEW_SINK=$SINK2_NAME
else
    NEW_SINK=$SINK1_NAME
fi

pactl set-default-sink "$NEW_SINK"

pactl list short sink-inputs | cut -f1 | while read sink_input; do
    pactl move-sink-input "$sink_input" "$NEW_SINK"
done

