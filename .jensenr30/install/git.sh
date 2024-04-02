#!/bin/bash

git config --global user.name "Ryan Jensen"
#git config --global user.email jensenr30@gmail.com
git config --global core.editor e
git config --global core.autocrlf input
git config --global core.excludesFile ~/.gitignore_global

git config --global pull.rebase false
git config --global init.defaultBranch main
git config --global rerere.enabled true

