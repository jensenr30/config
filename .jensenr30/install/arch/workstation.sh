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
$i fbreader
$i xournalpp # annotating PDFs and adding signatures.
$i libreoffice
$i --asdeps hunspell hunspell-en_us # libre office (spell check)
$i skanlite

#===============================================================================
# media editing
#===============================================================================
$i gimp
# fix gimp so it shows up in launcher search
sudo sed -i "s/Name=GNU Image Manipulation Program/Name=GIMP - GNU Image Manipulation Program/g" \
    /usr/share/applications/gimp.desktop
$i inkscape
$i audacity
$i kdenlive
$i obs-studio
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
# graphics / game / networking
$i sdl2 sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf
$i emscripten
$y nng
$i valgrind
$i lib32-mesa # amd 32-bit libraries
$i cloc # count lines of code

# # installing shit for mcuxpresso IDE
# $y python38
# $y ncurses5-compat-libs

# C
$i gcc gdb clang make cmake ninja bear
$i check cppcheck lcov

# graphics
$i opengl-man-pages
$i radeontop # gpu usage monitor

#===============================================================================
# Embedded systems
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
