#!/usr/bin/bash
source install-helper.sh

# printing
$i cups cups-pdf # printing system
$sys enable cups.service
$i avahi
$i nss-mdns
$sys enable avahi-daemon.service
# refer to the arch wiki, these instructions may be out of date:
# https://wiki.archlinux.org/title/Avahi#Hostname_resolution
# Then, edit the file /etc/nsswitch.conf and change the hosts line to include
# mdns_minimal [NOTFOUND=return] before resolve and dns like so:
# hosts: mymachines mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] files myhostname dns
$sys restart cups.service
# this final command makes the printer visible to applications on your workstation:
avahi-discover
