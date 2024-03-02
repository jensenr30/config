#!/usr/bin/sh

# ZFS
sudo pacman -S --noconfirm linux-lts-headers
yay -S zfs-dkms
yay -S zfs-linux-lts
# note: you may need to downgrade to an appropriate linux-ltx kernel
# use downgrade (yay -S downgrade)
# you may also have to downgrade your linux-lts-headers to the same version?
sudo systemctl enable --now zfs-import-cache.service
sudo systemctl enable --now zfs-mount.service
sudo systemctl enable --now zfs-import.target
sudo systemctl enable --now zfs.target
sudo zpool import -f 2174039371714181367 # safe
sudo zpool import -f 871189148089399739 # junk
sudo zpool set cachefile=/etc/zfs/zpool.cache  safe
sudo zpool set cachefile=/etc/zfs/zpool.cache junk
sudo systemctl enable --now zfs-scrub-weekly@safe.timer
sudo systemctl enable --now zfs-scrub-weekly@junk.timer

sudo zpool list

sudo pacman -S --noconfirm syncthing
sudo systemctl enable --now syncthing@$USER.service

# youtube download python server
sudo pacman -S --noconfirm python-flask

# NFS server
sudo pacman -S --noconfirm nfs-utils
# configure /etc/exports:
sudo cp server/etc/exports /etc/exports
# https://wiki.archlinux.org/title/NFS
sudo exportfs -arv
sudo systemctl enable --now nfs-server.service
sudo systemctl enable --now zfs-share.service
# alternative way:
# sudo zfs set sharenfs=on /media/safe

