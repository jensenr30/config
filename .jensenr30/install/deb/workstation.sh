#!/bin/bash
# a list of programs that I always want to have on my primary workstation
sudo apt update -y
sudo apt upgrade -y
i='sudo apt install -y'
$i firefox gimp vlc gimp vlc wine-stable kdenlive redshift qbittorrent kdiff3 dolphin konsole fbreader alacritty default-jre xournal

# LibreOffice
sudo apt install -y libreoffice-calc
sudo apt install -y libreoffice-writer

# youtube downloader
python3 -m pip install yt_dlp

# FreeCAD
sudo add-apt-repository ppa:freecad-maintainers/freecad-stable
sudo apt update
sudo apt install -y freecad
sudo apt install -y freecad-doc

# audacity
sudo add-apt-repository ppa:ubuntuhandbook1/audacity
sudo apt-get update
sudo apt install audacity

# Piper
sudo add-apt-repository ppa:libratbag-piper/piper-libratbag-git
sudo apt-get update
sudo apt install -y piper

# Programming
$i dfu-util

