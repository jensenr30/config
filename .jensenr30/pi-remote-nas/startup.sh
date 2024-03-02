#!/bin/bash

source $HOME/.bashrc

# start automatic audio downloader in new detached screen
screen-kill syncthing
echo "old screens killed"
k9 syncthing
screen -S "syncthing" -d -m bash -c '/opt/syncthing-linux-arm64-v1.23.7/syncthing; exec bash'

echo "new screens:"
screen -list

