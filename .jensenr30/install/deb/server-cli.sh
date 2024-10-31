#!/bin/bash
# settings and cli programs for every linux system
sudo apt update
sudo apt upgrade

i='sudo apt install -y'

# coreutils replacements / enhancements
$i bat
$i fd-find
$i 7zip
$i eza
$i neovim
$i bash-completion

# programming languages
$i python3 python3-pip
$i python3-pip
$i python-is-python3
#i rustc cargo

#terminal managers
$i screen
$i tmux

# downloaders
$i wget
$i curl
pip install -U yt-dlp

#system monitor
$i htop
$i atop
$i iftop
$i nethogs
$i sysstat
$i usbtop
$i bashtop

# networking
$i net-tools
$i sshfs
$i traceroute
$i arp-scan

# misc
$i rsync
$i minicom
$i fd-find
$i fzf
$i numlockx
$i xsel
