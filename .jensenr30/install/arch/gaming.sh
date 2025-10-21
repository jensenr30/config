#!/bin/bash

source install-helper.sh

$i snes9x retroarch gamemode
$i --asdeps retroarch-assets-ozone retroarch-assets-xmb retroarch-gtk 

mkdir -p ~/.config/retroarch/coreinfo
