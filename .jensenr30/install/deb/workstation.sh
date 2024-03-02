#!/bin/bash
# a list of programs that I always want to have on my primary workstation

sudo apt install -y firefox
sudo apt install -y gimp
sudo apt install -y vlc
sudo apt install -y wine-stable
sudo apt install -y kdenlive
sudo apt install -y redshift
sudo apt install -y qbittorrent
sudo apt install -y kdiff3
sudo apt install -y dolphin
sudo apt install -y konsole
sudo apt install -y fbreader
sudo apt install -y terminator
sudo apt install -y default-jre
sudo apt install -y xournal # useful for annotating PDFs and adding signatures.

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


