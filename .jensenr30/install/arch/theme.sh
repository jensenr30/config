#!/usr/bin/bash
source .install-helper
pacman-full-system-upgrade

flatpak install flathub org.kde.KStyle.Adwaita

i lxappearance qt5ct qt6ct
i gnome-themes-extra
y adwaita-qt4 adwaita-qt5-git and adwaita-qt6-git
i papirus-icon-theme
