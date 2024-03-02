#!/bin/bash
# fsearch
sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-daily
sudo apt-get update
sudo apt install git build-essential automake autoconf libtool pkg-config intltool autoconf-archive libpcre3-dev libglib2.0-dev libgtk-3-dev libxml2-utils
git clone https://github.com/cboxdoerfer/fsearch.git ~/prog/fsearch
