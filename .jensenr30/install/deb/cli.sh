#!/bin/bash

set -e 

# settings and cli programs for every linux system
sudo apt update

i='sudo apt install -y'

# coreutils replacements / enhancements
$i bat ripgrep fd-find 7zip eza neovim bash-completion atool git git-delta

# programming languages
$i python3 python3-pip python3-pip python-is-python3

#terminal managers
$i screen tmux

# downloaders
$i wget curl

#system monitor
$i htop atop iftop nethogs sysstat usbtop bashtop

# networking
$i net-tools sshfs traceroute arp-scan bridge-utils nmap

# misc
$i rsync minicom fd-find fzf numlockx xsel
