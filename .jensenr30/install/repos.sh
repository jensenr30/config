#!/usr/bin/sh
set -e

mkdir -p ~/repos

cdrepos="cd $HOME/repos"
$cdrepos

gc='git clone'

base='git@github.com:jensenr30'

function gc() {
    if test -d "$2"; then
        echo "skipping this directory (already exists): $2"
    else
        git clone "$1" "$2"
    fi
}


$cdrepos
gc $base/c-header-add-ifndef-macros.git c-header-add-ifndef-macros
cd ~/repos/c-header-add-ifndef-macros
make && make install

$cdrepos
gc $base/cad.git cad

$cdrepos
gc $base/fractile.git fractile

$cdrepos
gc $base/Gittyup.git gittyup
cd gittyup
git fetch up || git remote add up https://github.com/Murmele/Gittyup.git

$cdrepos
gc $base/GravityChaos.git gravity-chaos

$cdrepos
gc $base/lab.git lab

$cdrepos
gc $base/microcontrollers.git microcontrollers

$cdrepos
gc $base/TAoE3Solutions.git TAoE3Solutions

$cdrepos
gc $base/TileVenture.git tile-venture
cd tile-venture
git fetch up || git remote add up https://github.com/JPisaBrony/TileVenture.git

$cdrepos
gc git@github.com:dpayne/cli-visualizer.git cli-visualizer

$cdrepos
gc "$HOME" test-repo
gc "$HOME" test-remote
cd test-repo
git remote remove origin
git remote add origin ../test-remote

echo repos.sh done.
