#!/bin/bash

git config --global user.name "Ryan Jensen"
#git config --global user.email jensenr30@gmail.com
git config --global core.editor e

if [ "$sysname" == "linux" ]; then
    echo "$sysname line endings"
    git config --global core.autocrlf input
elif [ "$sysname" == "windows" ]; then
    echo "$sysname line endings"
    git config --global core.autocrlf true
else
    echo "unknown which line endings to use for sysname: $sysname"
fi
    
git config --global core.excludesFile ~/.gitignore_global

git config --global pull.rebase false
git config --global init.defaultBranch main
git config --global rerere.enabled true

