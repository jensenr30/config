#!/usr/bin/sh
set -e

sudo apt-get install -y python3-pip python3-setuptools python3-wheel
sudo apt-get install -y python3-numpy python3-pyqt5 python3-pyqt5.qtsvg git-core
sudo pip3 install dronecan
sudo pip3 install git+https://github.com/DroneCAN/gui_tool@master

