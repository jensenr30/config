#!/usr/bin/sh
set -e

# get list of mice
echo "mice connected to this machine:"
ratbagctl

DEV=$(ratbagctl | sed -e 's/:.*//g')

number_of_devices=$(echo "$DEV" | wc -l)
if (( $number_of_devices > 1 )); then
    echo "ERROR: too many mice connected to this machine."
    exit 1
fi

echo "your device is: $DEV"

echo "using profile 0, disabling others..."
ratbagctl $DEV profile active set 0
ratbagctl $DEV profile 1 disable
ratbagctl $DEV profile 2 disable

# ratbagctl dpi get-all
echo "setting resolutions..."
ratbagctl $DEV profile 0 resolution 0 dpi set 500
ratbagctl $DEV profile 0 resolution 1 dpi set 800
ratbagctl $DEV profile 0 resolution 2 dpi set 1200
ratbagctl $DEV profile 0 resolution 3 dpi set 1800
ratbagctl $DEV profile 0 resolution 4 dpi set 2800

ratbagctl $DEV profile 0 resolution active set 4
ratbagctl $DEV profile 0 resolution default set 4

# ratbagctl $DEV rate get-all
echo "setting polling rate..."
ratbagctl $DEV rate set 1000

# e /usr/include/linux/input-event-codes.h
echo "setting macro keys..."

# back button
ratbagctl $DEV button 3 action set macro +KEY_LEFTALT +KEY_LEFT -KEY_LEFT -KEY_LEFTALT
# forward button
ratbagctl $DEV button 4 action set macro +KEY_LEFTALT +KEY_RIGHT -KEY_RIGHT -KEY_LEFTALT
# just behind the forward most button
ratbagctl $DEV button 6 action set macro +KEY_RIGHTCTRL +KEY_RIGHTSHIFT +KEY_F -KEY_F -KEY_RIGHTCTRL -KEY_RIGHTSHIFT
# forward most button
ratbagctl $DEV button 7 action set macro +KEY_RIGHTALT +KEY_RIGHTSHIFT +KEY_I -KEY_I -KEY_RIGHTALT -KEY_RIGHTSHIFT
# center button
ratbagctl $DEV button 8 action set special resolution-cycle-up

LEDs=$(ratbagctl $DEV info | grep -i "Number of Leds: " | sed "s/.*Number of Leds: //g")

if (( $LEDs >= 1 )); then
    echo "setting LEDs..."
    ratbagctl $DEV led 0 set mode on
    ratbagctl $DEV led 0 set color 00FF00
    ratbagctl $DEV led 0 set brightness 255

    ratbagctl $DEV led 1 set mode on
    ratbagctl $DEV led 1 set color 00FF00
    ratbagctl $DEV led 1 set brightness 255
else
    echo "no LEDs to configure"
fi

# verify config
ratbagctl "$DEV" info
