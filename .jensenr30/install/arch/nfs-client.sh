#!/usr/bin/sh

if [ "$USER" != "root" ]; then
    echo "must run this script as root"
    exit
fi

sudo echo "192.168.0.200 server" >> /etc/hosts
sudo pacman -S --noconfirm nfs-utils
showmount -e server
sudo echo 'server:/media  /nas  nfs defaults,timeo=900,retrans=5,_netdev  0 0' >> /etc/fstab
sudo mount -m server:/media /nas

