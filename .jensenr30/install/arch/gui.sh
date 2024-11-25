#!/bin/bash
# basic GUI programs I want on every linux desktop environment
source install-helper.sh

$i xorg
$i polybar
$i dmenu
# $y albert
$i terminator
$i alacritty
$i --asdeps tk # for gitk to work
$i nm-connection-editor

# fonts
$i ttf-inconsolata-nerd
$i noto-fonts-cjk #chinese, japan, korean
$i ttf-joypixels # emoji

$i dolphin
# all dolphin deps
$i --asdeps ffmpegthumbs kde-cli-tools kdegraphics-thumbnailers kio-admin konsole purpose
$i thunar
$i --asdeps thunar-archive-plugin tumbler ffmpegthumbnailer
# fix dolphin's broken 'open with' menu - see .profile too
$i archlinux-xdg-menu
kbuildsycoca6

$i keepassxc xdotool xsel
$i ark p7zip unrar
$i gparted

# media
$i vlc
$i mplayer
$y nomacs
$y qimgv

# media creation
$i kolourpaint

$i pavucontrol
# $i pulseaudio-equalizer-ladspa this conflicts with pipewire

# emoji selector
$y emote

# notification server
$i libnotify xfce4-notifyd

# authorization agent & GUI
$i polkit
$i lxqt-policykit

# information about hardware
$y hardinfo2
