#!/bin/bash

# copy desktop files from you system into your home repo.
source ~/.cfgdir
mkdir -p $CFGDIR/desktop-files
rsync -v -u -r  /usr/share/applications/$HOSTNAME $CFGDIR/desktop-files
