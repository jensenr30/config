#!/bin/bash
# basic GUI programs I want on every linux desktop environment
source install-helper.sh

$i xorg
$i polybar
$i dmenu
$i unclutter
# $y albert
$i alacritty
$i terminator
$i tk # for gitk to work
$i nm-connection-editor

$i firefox

# fonts
$i ttf-inconsolata-nerd
$i noto-fonts-cjk #chinese, japan, korean
$i ttf-joypixels # emoji

$i dolphin
# all dolphin deps
$i ffmpegthumbs kde-cli-tools kdegraphics-thumbnailers kio-admin konsole purpose
$i thunar
$i thunar-archive-plugin tumbler xfce4-settings 
$y ffmpegthumbnailer tumbler-folder-thumbnailer
# fix dolphin's broken 'open with' menu - see .profile too
$i archlinux-xdg-menu
kbuildsycoca6

$i keepassxc xdotool xsel
$i ark p7zip unrar
$i gparted

# media
$i vlc
$i mplayer
$y nomacs qimgv sumatrapdf

# media creation
$i kolourpaint

$i pavucontrol
# $i pulseaudio-equalizer-ladspa this conflicts with pipewire

# emoji selector
$y emote

# notification server
$i libnotify dunst

# authorization agent & GUI
$i polkit
$i lxqt-policykit

# information about hardware
$y hardinfo2
