#!/bin/bash
# install programs for my primary workstation
source install-helper.sh

# NOTE: commented items are covered by workstation.nix

# disable EndeavourOS's firewall
# this is necessary for things like network printing to work.
# $sys disable --now firewalld

# package managers
$i flatpak

# internet
$i firefox
# $i torbrowser-launcher
$i qbittorrent

#===============================================================================
# office
#===============================================================================
$i fbreader
$i xournalpp # annotating PDFs and adding signatures.
$i libreoffice
$i --asdeps hunspell hunspell-en_us # libre office (spell check)

# fonts
$i ttf-inconsolata-nerd

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
$i v4l2loopback-dkms
$y simplescreenrecorder
$y gcolor2
$i xf86-input-wacom
# TODO: do I actually use this?
$y wacom-utility

# cd ripping
$y abcde
$i --asdeps glyr flac cdparanoia lame opus-tools
$y --asdeps python-eyed3

#===============================================================================
# programming
#===============================================================================
$i kdiff3
$y visual-studio-code-bin
$y gnome-keyring # for vs code
# #$i rustc  # TODO: fix this
# #$i cargo
$p pre-commit
$i python-pdm
$i doxygen
# graphics / game / networking
$i sdl2 sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf
$i emscripten
$y nng
$i valgrind
$i lib32-mesa # amd 32-bit libraries

# # installing shit for mcuxpresso IDE
# $y python38
# $y ncurses5-compat-libs

# C
$i gdb
$i check
$i cppcheck
$i lcov
$i make cmake
$i clang
$i multilib-devel   # 32-bit libraries for compiling for ARM etc.
$i bear # generates compile_commands.json

# graphics
$i opengl-man-pages

#===============================================================================
# Embedded systems
#===============================================================================
# this is for dronecan_gui_tool:
$i python-pip python-setuptools python-wheel
$i python-numpy python-pyqt5
$i --asdeps qt5-svg
$p dronecan
$p git+https://github.com/DroneCAN/gui_tool@master
# arm GNU build chain
#
$i arm-none-eabi-gcc arm-none-eabi-gdb
$i --asdeps arm-none-eabi-newlib
# for building unity tests
$i ruby rubygems

# electronics
$i pulseview

# CAD
$i freecad
$i kicad
$i --asdeps kicad-library kicad-library-3d

#===============================================================================
# misc
#===============================================================================
$i discord
$y fsearch
$i piper
$y qdirstat
$i shutter
$i deepin-screenshot
$i wine

# benchmarking
$y geekbench

# usbtop
$y usbtop
sudo modprobe usbmon

$i docker
$i --asdeps docker-buildx
sudo usermod -aG docker ryan
sudo systemctl enable --now docker

# via (keyboard customization)
$y via-bin

$y etcher-bin
$i virtualbox
