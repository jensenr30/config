#!/usr/bin/bash
source install-helper.sh

$i xf86-video-amdgpu libva-mesa-driver mesa-vdpau

cd ../hardware
./xorg.conf.d.sh
