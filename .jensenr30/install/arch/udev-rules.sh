#!/usr/bin/sh

sudo cp udev-rules/* /etc/udev/rules.d/
sudo udevadm control --reload

echo "echo /etc/udev/rules.d/"
ls -lA /etc/udev/rules.d/

