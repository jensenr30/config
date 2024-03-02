#!/usr/bin/sh

sudo pacman -S --noconfirm alsa-scarlett-gui
FILE='/etc/modprobe.d/scarlett.conf'

printf "\nconfig file: $FILE\n"
echo 'options snd_usb_audio vid=0x1235 pid=0x8215 device_setup=1' | sudo tee "$FILE" && printf "wrote config to file: $FILE\n"

printf "\nyou have to download REAPER from their website\n"
