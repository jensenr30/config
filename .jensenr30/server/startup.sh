#!/bin/bash

source $HOME/.bashrc

# start certain processes up after the computer boots up
screen-kill ytda ytdv yt-download-server syncthing ping-record
echo "old screens killed"

screen -S "ytda" -d -m bash -c 'cd ~/nas/music/download; yt-continuous-download-audio; exec bash'
screen -S "ytdv" -d -m bash -c 'cd ~/nas/youtube; yt-continuous-download-video; exec bash'
screen -S "yt-download-server" -d -m bash -c 'cd ~/bin/media/yt-download-server; ./run_server.sh; exec bash'
screen -S "syncthing" -d -m bash -c 'syncthing; exec bash'
screen -S "ping-record" -d -m bash -c 'ping-record; exec bash'

echo -n "waiting for screens to boot up"

sleep 0.1 && echo -n "."
sleep 0.1 && echo -n "."
sleep 0.1 && echo -n "."
sleep 0.1 && echo -n "."
sleep 0.1 && echo -n "."
sleep 0.1 && echo -n "."
sleep 0.1 && echo -n "."
sleep 0.1 && echo -n "."
sleep 0.1 && echo -n "."
sleep 0.1 && echo "."

screen -list

