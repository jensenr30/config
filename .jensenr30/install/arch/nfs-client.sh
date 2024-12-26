#!/usr/bin/bash

set -e

source install-helper.sh

if [ "$USER" != "root" ]; then
    echo "must run this script as root"
    exit
fi

realdir='/home/ryan/nas'

$i nfs-utils
showmount -e server
ln -s "$realdir" /nas
safe_fstab="server:$realdir/safe  $realdir/safe  nfs defaults,timeo=900,retrans=5,_netdev  0 0"
junk_fstab="server:$realdir/junk  $realdir/junk  nfs defaults,timeo=900,retrans=5,_netdev  0 0"
echo "$safe_fstab" >> /etc/fstab
echo "$junk_fstab" >> /etc/fstab
bat /etc/fstab
systemctl daemon-reload
systemctl restart remote-fs.target
# prevent shutdown from hanging - network manager must wait until NFS unmounts before quitting
systemctl enable --now NetworkManager-wait-online.service
tree -L 2 /nas
