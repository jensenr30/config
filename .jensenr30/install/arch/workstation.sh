#!/bin/bash
# install programs for my primary workstation
source .install_aliases.sh
pacman-full-system-upgrade

# internet
i firefox
i torbrowser-launcher
i qbittorrent

# office
i fbreader
i xournalpp # annotating PDFs and adding signatures.
# libre office
i libreoffice
# libre office (spell check)
i hunspell
i hunspell-en_us


# printing
i cups cups-pdf # printing system
enable cups.service
i avahi
i nss-mdns
enable avahi-daemon.service
# refer to the arch wiki, these instructions may be out of date:
# https://wiki.archlinux.org/title/Avahi#Hostname_resolution
# Then, edit the file /etc/nsswitch.conf and change the hosts line to include mdns_minimal [NOTFOUND=return] before resolve and dns:
# hosts: mymachines mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] files myhostname dns
sudo systemctl restart cups.service
# this final command makes the printer visible to applications on your workstation:
avahi-discover

# fonts
i ttf-inconsolata-nerd

# media editing
i gimp
i audacity
i kdenlive
i obs-studio
y gcolor2
i xf86-input-wacom
y wacom-utility

# cd ripping
y abcde
i --asdeps glyr flac cdparanoia lame opus-tools vorbisgain
y --asdeps python-eyed3

# programming
i kdiff3
y visual-studio-code-bin
y gnome-keyring # for vs code
#i rustc  # TODO: fix this
#i cargo
p pre-commit
i python-pdm
i doxygen

# installing shit for mcuxpresso IDE
y python38
y ncurses5-compat-libs

# C programming
i gdb
i check
i cppcheck
i lcov
i make cmake
i clang
i multilib-devel   # 32-bit libraries for compiling for ARM etc.
i openocd
i bear # used generate compilation database for clang tooling

# Embedded systems
yay -S can-utils
# this is for dronecan_gui_tool:
i python-pip python-setuptools python-wheel
i python-numpy python-pyqt5
i --asdeps qt5-svg
pipx install dronecan
pipx install git+https://github.com/DroneCAN/gui_tool@master
# arm GNU build chain
i arm-none-eabi-gcc arm-none-eabi-gdb
i --asdeps arm-none-eabi-newlib
# for building unity tests, IIRC
i ruby rubygems

# electronics
i pulseview

# CAD
i freecad
i kicad
i --asdeps kicad-library kicad-library-3d

# misc
i piper
i wine
i shutter
y qdirstat
y fsearch

# benchmarking
y geekbench

# usbtop
y usbtop
sudo modprobe usbmon

# via (keyboard customization)
y via-bin
