#!/bin/bash
source install-helper.sh

$flat flathub org.kde.KStyle.Adwaita
$i lxappearance || $i lxappearance-gtk3
$i qt5ct qt6ct
$i gnome-themes-extra
$y adwaita-qt5-git adwaita-qt6-git
$i papirus-icon-theme
$i breeze breeze5 breeze-gtk
