#!/usr/bin/sh
# map tablet to a screen
# e.g. xinput map-to-output 21 DisplayPort-2

primary_screen=$(xrandr | grep -i primary | cut -d ' ' -f 1)
tablet_input_devices=$(xinput | grep -i wacom | sed 's/.*id=//g' | sed 's/\s.*//g')

for d in $tablet_input_devices;
do
    echo "mapping wacom tablet (xinput device #$d) to screen: $primary_screen"
    xinput map-to-output $d "$primary_screen"
done
