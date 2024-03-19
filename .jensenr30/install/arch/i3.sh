#!/bin/bash
source install-helper.sh

$i i3-wm
$i polybar
$i arandr # GUI tool for monitor config using xrandr
$i picom # compositor
$i feh

$i xorg-xinit
# overwrite ~/.xinitrc with defaults
orig=/etc/X11/xinit/xinitrc
mine="$HOME/.xinitrc"
echo "copying $orig to $mine"
cp "$orig" "$mine"

sed -i "/twm &/,$ d" "$HOME/.xinitrc" && bat ~/.xinitrc
echo "source .xinitrc-ryan" >> "$mine"
echo "Diff between $orig and $mine:"
diff --color=auto /etc/X11/xinit/xinitrc ~/.xinitrc
