#!/usr/bin/bash

sudo apt install -y python3-flask

mkdir -p ~/.local/bin/
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
chmod a+rx ~/.local/bin/yt-dlp  # Make executable
