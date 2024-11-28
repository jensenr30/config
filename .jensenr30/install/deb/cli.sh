#!/bin/bash
# settings and cli programs for every linux system
sudo apt update

$i='sudo apt install -y'

# coreutils replacements / enhancements
$i bat ripgrep fd-find 7zip exa neovim bash-completion atool git git-delta

# programming languages
$i python3 python3-pip python3-pip python-is-python3

# development tools
pip install pre-commit
$i can-utils

#terminal managers
$i screen tmux

# downloaders
$i wget curl
pip install -U yt-dlp

#system monitor
$i htop atop iftop nethogs sysstat usbtop bashtop

# networking
$i net-tools sshfs traceroute arp-scan bridge-utils

# misc
$i rsync minicom fd-find fzf numlockx xsel
