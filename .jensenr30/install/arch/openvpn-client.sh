#!/usr/bin/bash

set -e

source install-helper.sh

if [ "$USER" != "root" ]; then
    echo "must run this script as root"
    exit 1
fi

$i openvpn

dir='/etc/openvpn/client'

conf_file="$dir/client.conf"
if ! test -f "$conf_file"; then
    echo "copying example configuration file to $conf_file"
    cp "/usr/share/openvpn/examples/client.conf" "$conf_file"
    ls --color=auto "$conf_file"
else
    echo "configuration file already existed at $conf_file"
fi

ca="$dir/ca.crt"
if ! test -f "$ca"; then
    echo "missing $ca"
    echo "see openvpn-server.txt"
    exit 404;
fi

cert="$dir/client.crt"
if ! test -f "$cert"; then
    echo "missing $cert"
    echo "see openvpn-server.txt"
    exit 404;
fi

key="$dir/client.key"
if ! test -f "$key"; then
    echo "missing $key"
    echo "see openvpn-server.txt"
    exit 404;
fi

echo "ca, cert, and key are all present!"

service="openvpn-client@client.service"
echo "Enabling systemd service: $service ..."
systemctl enable --now "$service"

echo -n "sleeping for a sec to let the virtual network warm up ;)   ."
sleep 1
echo -n "."
sleep 1
echo -n "."
sleep 1
echo "."

if ! grep -q $(cat /etc/hosts | grep server2); then
    echo "server2 already in hosts file"
else
    echo "server2 not in hosts file. Adding it now..."
    echo "10.8.0.1 server2" >> /etc/hosts
fi

sed -i 's/remote my-server-1 1194/remote server2 1194/g' /etc/openvpn/client/client.conf

echo "Last step: add server2 to the hosts file!"
