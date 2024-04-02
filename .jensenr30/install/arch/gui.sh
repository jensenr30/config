#!/bin/bash
# basic GUI programs I want on every linux desktop environment
source install-helper.sh

$i xorg
$i polybar
$i dmenu
$y albert
$i terminator
$i alacritty
$i --asdeps tk # for gitk to work
$i nm-connection-editor

$i dolphin
$i --asdeps konsole # for dolphin's integrated terminal
$i thunar
$i --asdeps thunar-archive-plugin tumbler ffmpegthumbnailer

$i keepass xdotool xsel
$i ark p7zip unrar
$i gparted

# media consumption
$i vlc
$i mplayer
$y nomacs
$y qimgv

# audio
# TODO remove:
# pipewire-pulse conflicts with (replaces?) pulseaudio
# if test -z $(type -P pipewire-pulse); then
#     $i pulseaudio
# fi

# TODO test:
$i pipewire-pulse || $i pulseaudio

$i pavucontrol
$i pulseaudio-equalizer-ladspa

# fix font issues on firefox where special japanese / chinese character don't render
$i noto-fonts-cjk

# emoji selector
$y emote

# notification server
$i libnotify dunst

# authorization agent & GUI
$i polkit
