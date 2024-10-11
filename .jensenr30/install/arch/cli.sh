#!/bin/bash
source install-helper.sh

# NOTE: commented lines are probably covered by home-manager

# install yay
$i base-devel

if test ! -d "$HOME/repos/utils/yay"; then
    echo "installing yay..."
    mkdir -p "$HOME/repos/utils"
    cd "$HOME/repos/utils"
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg --noconfirm -si
fi

$i man-pages
$i networkmanager
$sys enable --now NetworkManager.service
# this prevents NFS mounts from causing shutdown to hang for 1 m 30 s
$sys enable --now NetworkManager-wait-online.service

# arch
$i pacman-contrib # for pactree
$i arch-install-scripts # for genfstab
$y downgrade
# for configuring installation media
$i syslinux

# numlock always ON
$y systemd-numlockontty
$sys enable --now numLockOnTty

# git
$i git
$i git-delta

# coreutils
$i bat
$i fd
$i which
$i eza
$i atool
$i unrar zip unzip

# programming & dev tools
$i python3
$i python-pip
$i python-pipx

#terminal managers
$i screen
$i tmux

# downloaders
$i wget
$i curl
$p yt-dlp

#system monitor
$i htop
$i atop
$i iftop
$i nethogs
$i sysstat # for iostat
$i usbutils # for lsusb
$i bashtop

# networking
$i net-tools
$i traceroute
$i arp-scan
$i nmap
$i sshfs

# network time protocol
sudo timedatectl set-timezone America/Chicago
sudo timedatectl set-ntp true
timedatectl # print info

# file systems
$i dosfstools mtools
$i ntfs-3g

# misc
$i rsync
$i minicom
$i fzf
$i numlockx
$i bash-completion
$i exfatprogs
$i  pkgstats # volunteer some info to arch developers
$i cronie
$sys enable --now cronie.service
$i xclip
$i xsel
$i neofetch
$i lsb-release

# crontab -e
# see README.md for crontab entry
