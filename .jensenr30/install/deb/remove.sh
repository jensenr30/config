#!/bin/bash

# programs I never want to use  :)
sudo apt remove -y pluma
sudo apt remove -y thunderbird
sudo apt remove -y caja
sudo apt remove -y mate-calc
sudo apt remove -y nano
sudo apt remove -y nemo
sudo apt remove -y 
# all the terminal emulators I don't want
sudo apt remove -y gnome-terminal
sudo apt remove -y mate-terminal
sudo apt remove -y xfce4-terminal
sudo apt remove -y konsole
sudo apt remove -y xterm
sudo apt remove -y uxterm
sudo apt remove -y tilda
sudo apt remove -y caja-open-terminal

sudo apt autoremove -y
sudo apt autoclean -y

