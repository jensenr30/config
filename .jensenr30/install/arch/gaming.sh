#!/bin/bash

source install-helper.sh

$i snes9x retroarch gamemode
$i --asdeps retroarch-assets-xmb

mkdir -p ~/.config/retroarch/coreinfo
