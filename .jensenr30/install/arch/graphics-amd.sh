#!/usr/bin/sh

sudo pacman -S --noconfirm xf86-video-amdgpu libva-mesa-driver mesa-vdpau
./xorg.conf.d.sh
