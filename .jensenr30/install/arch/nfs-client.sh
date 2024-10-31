#!/usr/bin/bash

set -e

source install-helper.sh

if [ "$USER" != "root" ]; then
    echo "must run this script as root"
    exit
fi

echo "192.168.0.200 server" >> /etc/hosts
$i nfs-utils
showmount -e server
echo 'server:/media  /nas  nfs defaults,timeo=900,retrans=5,_netdev  0 0' >> /etc/fstab
mkdir -p /nas
mount -m server:/media /nas
