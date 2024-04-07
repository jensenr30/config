#!/usr/bin/sh

dir="/etc/X11/xorg.conf.d/"
sudo cp xorg.conf.d/* "$dir"

echo "echo ls -lA $dir"
ls -lA "$dir"

