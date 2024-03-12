#!/bin/bash
# basic GUI programs I want on every linux desktop environment
source .install-helper

pacman-full-system-upgrade

i xorg
y albert # i dmenu
i terminator
i alacritty
i --asdeps tk # for gitk to work
i nm-connection-editor

i dolphin
i --asdeps konsole # for dolphin's integrated terminal
i thunar
i --asdeps thunar-archive-plugin tumbler ffmpegthumbnailerf

i keepass xdotool xsel
i ark p7zip unrar
y nomacs
i gparted

# media consumption
i vlc
i mplayer

# audio
i pulseaudio
i pavucontrol
i pulseaudio-equalizer-ladspa

# fix font issues on firefox where special japanese / chinese character don't render
i noto-fonts-cjk

# notification server
i libnotify dunst

# authorization agent & GUI
i polkit
