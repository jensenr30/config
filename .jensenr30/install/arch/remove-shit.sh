#!/usr/bin/sh

echo "WARNING! This script will remove gnome components from your system!"
echo "Do NOT run this script if you are using a gnome desktop environment!"
# quit causing pavucontrol to take fucking forever to start!!
sudo pacman -Rs --noconfirm xdg-desktop-portal-gnome

# remove EndeavourOS default login
sudo pacman -Rs eos-lightdm-slick-theme
sudo pacman -Rs lightdm lightdm-slick-greeter
