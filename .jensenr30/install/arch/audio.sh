#!/usr/bin/bash
source install-helper.sh

$i pipewire wireplumber pipewire-audio pipewire-pulse
sudo systemctl enable --now pipewire-pulse.service
sudo systemctl status pipewire-pulse.service

echo "You will need to reboot the machine"
