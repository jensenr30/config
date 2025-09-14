#!/bin/bash
# install programs for my primary workstation
source install-helper.sh

# package managers
$i flatpak

# internet
$i firefox chromium qbittorrent discord

#===============================================================================
# office
#===============================================================================
$i fbreader xournalpp libreoffice skanlite
$i --asdeps hunspell hunspell-en_us # libre office (spell check)

#===============================================================================
# media editing
#===============================================================================
$i gimp inkscape shotcut audacity obs-studio
# fix gimp so it shows up in launcher search
sudo sed -i "s/Name=GNU Image Manipulation Program/Name=GIMP - GNU Image Manipulation Program/g" \
    /usr/share/applications/gimp.desktop
$y simplescreenrecorder
$y gcolor2
$i xf86-input-wacom
# TODO: do I actually use this?
$y wacom-utility

# allow obs to make virtual webcam
$i v4l2loopback-dkms linux-headers
sudo modprobe v4l2loopback

# cd ripping
$y abcde
$i --asdeps glyr flac cdparanoia lame opus-tools
$y --asdeps python-eyed3
$y mp3tag


#===============================================================================
# programming
#===============================================================================
$i kdiff3
$y visual-studio-code-bin
$y gnome-keyring # for vs code
$p pre-commit
$i python-pdm
$i doxygen
$i valgrind
$i cloc # count lines of code

# # installing shit for mcuxpresso IDE
# $y python38
# $y ncurses5-compat-libs

# C
$i gcc gdb clang make cmake ninja bear
$i check cppcheck lcov

# python LSP
$i pyright

# graphics
$i opengl-man-pages
$y vulkan-man-pages
$i vulkan-devel
$i radeontop # gpu usage monitor
# graphics / game / networking
$i sdl2 sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf
$y sdl2-manpage-git
$i emscripten
$y nng
$i lib32-mesa # amd 32-bit libraries

#===============================================================================
# embedded systems
#===============================================================================
# this is for dronecan_gui_tool:
$i python-pip python-setuptools python-wheel python-numpy python-pyqt5
$i --asdeps qt5-svg
$p dronecan
$p git+https://github.com/DroneCAN/gui_tool@master
# arm GNU build chain
#
$i arm-none-eabi-gcc arm-none-eabi-gdb
$i --asdeps arm-none-eabi-newlib
$i multilib-devel   # 32-bit libraries for compiling for ARM etc.
$i ruby rubygems # for building unity tests

# electronics
$i pulseview
$y gtkterm

# CAD
$i freecad
$i kicad
$i --asdeps kicad-library kicad-library-3d

#===============================================================================
# containers / virtualization
#===============================================================================
$i docker
$i --asdeps docker-buildx
sudo usermod -aG docker ryan
sudo systemctl enable --now docker

$i virtualbox
$i virt-manager


#===============================================================================
# misc
#===============================================================================
$y fsearch piper qdirstat shutter deepin-screenshot wine geekbench

# usbtop
$y usbtop
RED='\x1b[31;1m'
NOCOLOR='\033[0m'
sudo modprobe usbmon || echo -e "${RED}error modprobe usbmon!${NOCOLOR}"

$y via-bin (keyboard customization)
