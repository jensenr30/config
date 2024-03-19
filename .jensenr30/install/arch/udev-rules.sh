#!/usr/bin/sh

sudo cp udev-rules/* /etc/udev/rules.d/
sudo udevadm control --reload

cmd='ls -lA /etc/udev/rules.d/'
echo "$cmd"
$cmd
