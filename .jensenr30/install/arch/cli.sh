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

$i git git-delta bat fd which eza atool unrar zip unzip gdu yazi tree ripgrep screen tmux

# programming & dev tools
$i python3 python-pip python-pipx

# downloaders
$i wget curl
$p yt-dlp

#system monitor
$i htop atop iftop nethogs sysstat usbutils bashtop

# networking
$i net-tools traceroute arp-scan nmap sshfs speedtest-cli openvpn

# network time protocol
sudo timedatectl set-timezone America/Chicago
sudo timedatectl set-ntp true
timedatectl # print info

# file systems
$i dosfstools mtools ntfs-3g

# misc
$i rsync minicom fzf numlockx bash-completion exfatprogs pkgstats cronie xclip xsel fastfetch lsb-release
$sys enable --now cronie.service

# crontab -e
# see README.md for crontab entry
