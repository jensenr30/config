#!/bin/bash
source install-helper.sh

# NOTE: commented lines are probably covered by home-manager

# install yay
$i base-devel neovim
$i rebuild-detector # provides checkrebuild
# then run:  yay -S --answerclean All --rebuildall <your-package>

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

# core utils
$i                      \
    atool               \
    bat                 \
    eza                 \
    fd                  \
    gdu                 \
    git                 \
    git-delta           \
    grc                 \
    ripgrep             \
    screen              \
    strace              \
    tmux                \
    tree                \
    unrar               \
    unzip               \
    which               \
    yazi                \
    zellij              \
    zip                 \

# programming & dev tools
$i python3 python-pip python-pipx

# downloaders
$i wget curl
$p yt-dlp

#system monitor
$i htop atop iftop iotop nethogs sysstat usbutils btop

# networking
$i net-tools traceroute arp-scan nmap sshfs speedtest-cli openvpn

# network time protocol
sudo timedatectl set-timezone America/Chicago
sudo timedatectl set-ntp true
timedatectl # print info

# file systems
$i dosfstools mtools ntfs-3g exfat-utils


################################################################################
# misc
################################################################################
$i rsync minicom fzf numlockx bash-completion exfatprogs pkgstats cronie xclip xsel fastfetch lsb-release cmatrix
$sys enable --now cronie.service

# numlock always ON
$y systemd-numlockontty
$sys enable --now numLockOnTty

# screen backlight control
$i brightnessctl



# crontab -e
# see README.md for crontab entry
