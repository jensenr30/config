sudo pacman -S --noconfirm xorg-xinit

# overwrite ~/.xinitrc with defaults
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "NOW: remove lines from 'twm...' through 'exec...' with: i3"
