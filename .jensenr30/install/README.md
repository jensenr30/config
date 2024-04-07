# Installation of Programs on new Linux System

directories are organized by linux distribution

## .sh scripts in distribution-specific sub-directories
E.g. `./cli.sh` will install essential command-line tools. (mostly replaced by nix home-manager.
run `home-manager switch`)
E.g. `./gui.sh` will install simple gui programs.
E.g. `./workstation.sh` will install a shitload of bloated programs, mostly GUI.

## master_startup.py
To activate your startup scripts, use crontab:
`crontab -e`
Enter this line after the comment block:
`@reboot /usr/bin/python ~/.jensenr30/master_startup.py`
