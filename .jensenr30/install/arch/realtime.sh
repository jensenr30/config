#!/usr/bin/bash

source install-helper.sh

sudo pacman -S rt-tests realtime-privileges
sudo usermod -aG realtime $USER
groups
