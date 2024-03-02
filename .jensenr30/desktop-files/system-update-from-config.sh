#!/bin/bash

# copy desktop files from you system into your home repo.
source ~/.cfgdir
mkdir -p $CFGDIR/desktop-files
sudo rsync -v -u -r $CFGDIR/desktop-files/$HOSTNAME /usr/share/applications

