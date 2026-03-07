#!/usr/bin/bash

set -x

printf "Kill the old daemons\n"

killall -9 picom
killall -9 albert
killall -9 lxqt-policykit-agent
killall -9 unclutter
killall -9 dunst
killall -9 lxqt-notificationd
killall -9 xfce4-notifyd

# start up sound
paplay --volume=40000 .jensenr30/private/audio-clips/windows-95-startup.wav &

# configure monitor resolution, frame rate
bash ~/.jensenr30/screen-layout/$HOSTNAME.sh

# set keyboard repeat delay and frequency
xset r rate 190 80

# set monitors to turn off ater 30 minutes of inactivity
xset dpms 0 0 1800
# disable screen saver
xset s off


printf "Starting up apps\n"

# desktop background
feh --bg-fill "$HOME/.jensenr30/$HOSTNAME/desktop/layout-art-activate-linux.png"
polybar-launch-on-all-monitors
# compositor
#picom -b --config $HOME/.jensenr30/cfg/picom.conf &
# auto hide the mouse
unclutter --timeout 3 --ignore-scrolling &
# notifications
dunst &


# Some apps may need a delay after starting x before they can successfully be run
sleep 5

# GUI authentication
lxqt-policykit-agent &
