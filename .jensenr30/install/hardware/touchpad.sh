#!/usr/bin/bash

set -e
set -x

device='Hailuck Co.,Ltd PTP TouchPad Touchpad'
scroll_speed="50" # slowest possible scroll speed feels right in firefox

id=$(xinput list | grep -i "$device" | grep -o "id=[0-9]*" | grep -o "[0-9]*")
echo "configuring $device (xinput device id $id)..."
echo "setting scroll speed to $scroll_speed"
xinput set-prop $id "libinput Scrolling Pixel Distance" "$scroll_speed"

