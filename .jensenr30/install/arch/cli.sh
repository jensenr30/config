#!/bin/bash

pacman-full-system-upgrade

alias i='sudo  pacman -S --noconfirm'
alias p='pipx install'
alias y='yay -S --noconfirm'

# install yay
i base-devel
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

i networkmanager
sudo systemctl enable --now NetworkManager.service
# this prevents NFS mounts from causing shutdown to hang for 1 m 30 s
sudo systemctl enable --now NetworkManager-wait-online.service

# arch
i base-devel
i pacman-contrib # for pactree
i arch-install-scripts # for genfstab
y downgrade

# numlock always ON
y systemd-numlockontty
sudo systemctl enable --now numLockOnTty

# git
i git

# coreutils
i bat
i fd
i which
i exa
i atool
i --asdeps --needed bzip2 cpio gzip lha xz lzop p7zip tar unace unrar zip unzip

# text editors
i vi vim neovim
y nvim-packer-git
nvim -c PackerSync

# programming & dev tools
i python3
i python-pip
i python-pipx

#terminal managers
i screen
i tmux

# downloaders
i wget
i curl
p yt-dlp

#system monitor
i htop
i atop
i iftop
i nethogs
i sysstat # for iostat
i usbutils # for lsusb
i bashtop

# networking
i net-tools
i traceroute
i arp-scan
i nmap
i sshfs

# network time protocol
sudo timedatectl set-timezone America/Chicago
sudo timedatectl set-ntp true
timedatectl # print info

# file systems
i dosfstools mtools
i ntfs-3g

# misc
i rsync
i minicom
i fzf
i numlockx
i bash-completion
i exfatprogs
i  pkgstats # volunteer some info to arch developers
i cronie
systemctl enable --now cronie.service
i xclip
i neofetch
i lsb-release
# crontab -e
# see README.md for crontab entry
