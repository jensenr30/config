#!/usr/bin/sh

export CFGDIR="$HOME/.jensenr30"
export EDITOR=nvim

#===============================================================================
# OS
#===============================================================================
if [ "$OSTYPE" == "linux-gnu" ]; then
    sysname="linux"
    sysname_short='lin'
elif [ "$OSTYPE" == "msys" ]; then
    sysname="windows"
    sysname_short='win'
fi
export sysname
export sysname_short


#===============================================================================
# distro
#===============================================================================
if [ $sysname == "linux" ]; then
    # distro=$(lsb_release -i | sed "s/Distributor ID:\t//g")
    distro=$(cat /etc/os-release | grep -e '^NAME="' | sed "s/NAME=//g" | sed "s/\"//g")
    distro=$(echo -n "$distro" | sed "s/ Linux//g")
    if   [ "$distro" == "Ubuntu" ]; then
        distro="deb"
    elif [ "$distro" == "Debian" ]; then
        distro="deb"
    elif [ "$distro" == "Arch" ]; then
        distro="arch"
    elif [ "$distro" == "EndeavourOS" ]; then
        distro="arch"
    fi
    export distro
fi


#===============================================================================
# home-manager & nix packages
#===============================================================================
# home manager will import a .nix file specific to this machine
ln -f -s "$HOME/.config/home-manager/by-hostname/$HOSTNAME.nix" "$HOME/.config/home-manager/hostname.nix"

# I do not plan on "having Home Manager manage your shell configuration then you must source"
hm_source_file="$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
if [ -f "$hm_source_file" ]; then
    . "$hm_source_file"
fi
# now run `home-manager switch` to make nix pkgs available to current user


#===============================================================================
# path
#===============================================================================
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.nix-profile/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/bin/app"
export PATH="$PATH:$HOME/bin/c"
export PATH="$PATH:$HOME/bin/dev"
export PATH="$PATH:$HOME/bin/git"
export PATH="$PATH:$HOME/bin/hardware"
export PATH="$PATH:$HOME/bin/media"
export PATH="$PATH:$HOME/pd/bin"

mkdir -p "$HOME/bin/$distro"
export PATH="$PATH:$HOME/bin/$distro"
mkdir -p "$HOME/bin/$sysname"
export PATH="$PATH:$HOME/bin/$sysname"

export PATH="$PATH:$HOME/prog"

# add cargo environment to your path only if you have it on the system
if [ -d "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

if [ $sysname == 'windows' ]; then
    export PATH="$PATH:/c/Program Files/Git"
fi


#===============================================================================
# programming
#===============================================================================
# ubuntu/debian requires manual installation of arm-none-eabi-gcc
if [ "$distro" == "deb" ]; then
    PATH="$PATH:$HOME/sdk/arm-none-eabi/bin"
fi

# used to compile web client for tileventure
export PATH="$PATH:/usr/lib/emscripten"



#===============================================================================
# Theme
#===============================================================================
# this breaks dolphin's theme on KDE plasma, but at one point it made dolphine
# use the correct theme on i3
export QT_QPA_PLATFORMTHEME=qt6ct


#===============================================================================
# color SSH sessions
#===============================================================================
SESSION_TYPE="normal"

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    SESSION_TYPE=remote/ssh
# many other tests omitted
else
    case $(ps -o comm= -p "$PPID") in
        sshd|*/sshd) SESSION_TYPE=remote/ssh;;
    esac
fi
export SESSION_TYPE

#===============================================================================
# Misc
#===============================================================================
# firefox smooth scrolling
export MOZ_USE_XINPUT2=1

export STM32CubeMX_PATH=/home/ryan/programs/stm32cubemx_6.12.0

atuin_source="$HOME/.atuin/bin/env"
if [ -f "$atuin_source" ]; then
    . "$atuin_source"
fi
