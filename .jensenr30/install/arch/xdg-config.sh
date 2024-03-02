#!/usr/bin/sh

xdg-settings set default-web-browser firefox.desktop
printf "xdg-settings get default-web-browser: "
xdg-settings get default-web-browser

