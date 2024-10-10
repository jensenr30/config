[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -e /home/ryan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ryan/.nix-profile/etc/profile.d/nix.sh; fi

. "$HOME/.atuin/bin/env"
