#!/usr/bin/sh
set -e

DIR="$HOME/repos/utils"
mkdir -p "$DIR"
cd "$DIR"

# ~/.bashrc runs `source` on the appropriate script in this repo
git clone https://github.com/cykerway/complete-alias.git || echo "ERROR cloning bash complete-alias repo"
