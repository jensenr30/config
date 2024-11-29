#!/usr/bin/bash

set -e

source install-helper.sh

if [ "$USER" != "root" ]; then
    echo "must run this script as root"
    exit
fi

realdir='/home/ryan/nas'

$i nfs-utils
showmount -e server2
# todo ln -s /nas "$realdir"
mkdir -p "$realdir/safe"
mkdir -p "$realdir/junk"
echo "server2:/nas/safe  $realdir/safe  nfs defaults,timeo=900,retrans=5,_netdev  0 0" >> /etc/fstab
echo "server2:/nas/junk  $realdir/junk  nfs defaults,timeo=900,retrans=5,_netdev  0 0" >> /etc/fstab
mount -m server2:/nas/safe "$realdir/safe"
mount -m server2:/nas/junk "$realdir/junk"
