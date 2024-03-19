#!/bin/bash
# install programs for my primary workstation
source install-helper.sh

# disable EndeavourOS's firewall
# this is necessary for things like network printing to work.
$sys disable --now firewalld

# package managers
$i flatpak

# internet
$i firefox
$i torbrowser-launcher
$i qbittorrent

# office
$i fbreader
$i xournalpp # annotating PDFs and adding signatures.
# libre office
$i libreoffice
# libre office (spell check)
$i hunspell
$i hunspell-en_us

# fonts
$i ttf-inconsolata-nerd

# media editing
$i gimp
$i inkscape
$i audacity
$i kdenlive
$i obs-studio
$i v4l2loopback-dkms
# TODO: this shouldn't be necessary if I get my polkit shit working
#sudo modprobe v4l2loopback
$y gcolor2
$i xf86-input-wacom
$y wacom-utility

# cd ripping
$y abcde
$i --asdeps glyr flac cdparanoia lame opus-tools vorbisgain
$y --asdeps python-eyed3

# programming
$i kdiff3
$y visual-studio-code-bin
$y gnome-keyring # for vs code
#i rustc  # TODO: fix this
#i cargo
$p pre-commit
$i python-pdm
$i doxygen

# installing shit for mcuxpresso IDE
$y python38
$y ncurses5-compat-libs

# C programming
$i gdb
$i check
$i cppcheck
$i lcov
$i make cmake
$i clang
$i multilib-devel   # 32-bit libraries for compiling for ARM etc.
$i openocd
$i bear # used generate compilation database for clang tooling

# Embedded systems
$y can-utils
# this is for dronecan_gui_tool:
$i python-pip python-setuptools python-wheel
$i python-numpy python-pyqt5
$i --asdeps qt5-svg
$p dronecan
$p git+https://github.com/DroneCAN/gui_tool@master
# arm GNU build chain
$i arm-none-eabi-gcc arm-none-eabi-gdb
$i --asdeps arm-none-eabi-newlib
# for building unity tests, IIRC
$i ruby rubygems

# electronics
$i pulseview

# CAD
$i freecad
$i kicad
$i --asdeps kicad-library kicad-library-3d

# misc
$i discord
$y fsearch
$i piper
$y qdirstat
$i shutter
$i wine

# benchmarking
$y geekbench

# usbtop
$y usbtop
sudo modprobe usbmon

# via (keyboard customization)
$y via-bin

# themes
$flat flathub org.kde.KStyle.Adwaita
$i lxappearance || $i lxappearance-gtk3
$i qt5ct qt6ct
$i gnome-themes-extra
# TODO: is this necessary?  -git?  can't i just get these from the arch repos?
$y adwaita-qt4 adwaita-qt5-git adwaita-qt6-git
$i papirus-icon-theme
