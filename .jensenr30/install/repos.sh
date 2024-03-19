#!/usr/bin/sh
set -e

mkdir -p ~/repos
cd ~/repos
gc='git clone'

base='git@github.com:jensenr30'

function gc() {
    if test -d "$2"; then
        echo "skipping this directory (already exists): $2"
    else
        git clone "$1" "$2"
    fi
}

gc $base/cad.git cad
gc $base/microcontrollers.git microcontrollers
gc $base/TAoE3Solutions.git TAoE3Solutions
gc $base/GravityChaos.git gravity-chaos
gc $base/Gittyup.git gittyup
gc $base/TileVenture.git tile-venture
gc $base/fractile.git fractile
gc $base/lab.git lab
gc $base/c-header-add-ifndef-macros.git c-header-add-ifndef-macros

cd ~/repos/c-header-add-ifndef-macros
make && make install

echo repos.sh done.
