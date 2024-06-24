#!/bin/bash


set e+ # a single error will not crash my .bashrc
# set -o vi # vim motions in bash - now you can get stuck in vim right on the command line!

if test -z $sysname; then
    source "$HOME/.profile"
fi

start_directory=$(pwd) # don't cause a net change in directory by running this script
shopt -s globstar # "**" in a pathname expansion context will match all files and 0 or more dirs and subdirs.
shopt -s expand_aliases # aliases work in non-interactive shells
source $HOME/.alias.sh
chmod --recursive a+x "$HOME/bin" # automatically enable executing any file placed into bin/


#===============================================================================
# print debug messages
#===============================================================================
verbose=${verbose:-0}
verbose() {
    if (( $verbose >= 1 )); then
        echo $@
    fi
}


#===============================================================================
# source a file.  if it doesn't exist, create it.
#===============================================================================
source_else_mkf()
{
    sf="$1"
    if [ -f "$sf" ]; then           # if file exists,
        verbose "sourcing $sf"
        source "$sf"
    else                            # if file doesn't exist,
        printf "creating $sf\n"
        mkdir -p $(printf "$sf" | grep -E -o ".+/")
        touch "$sf"
    fi
    chmod a+x "$sf"
}


#===============================================================================
# specify execute custom scripts based on hardware / user / operating system
#===============================================================================
# TODO: move this to .profile?
CFG_DIRS=(
    "$CFGDIR/$sysname"
    "$CFGDIR/$HOSTNAME"
)
CFG_FILES=(
    ".bashrc"
    ".alias.sh"
)
export setup_file=".system-setup"

for cfg_dir in "${CFG_DIRS[@]}"; do

    for cfg_file in "${CFG_FILES[@]}"; do
        source_else_mkf "$cfg_dir/$cfg_file"
        cd "$HOME"
    done

    setup_f="$cfg_dir/$setup_file"
    verbose "$setup_f"
    setup_complete_f="$setup_f.complete"
    if test ! -f "$setup_complete_f"; then
        echo "sourcing $setup_f"
        source_else_mkf "$setup_f"
        touch "$setup_complete_f"
    else
        verbose "$setup_complete_f: already existed: $setup_f has already been run"
    fi
done
cd "$HOME"


#===============================================================================
# Interactive terminal configuration
#===============================================================================
# TODO: what does this do again?  should it be at the top of this file??
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


#===============================================================================
# configure history
#===============================================================================
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1000000
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


#===============================================================================
# bash auto-complete
#===============================================================================
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /home/ryan/.local/state/nix/profiles/profile/share/bash-completion/bash_completion ]; then
    . /home/ryan/.local/state/nix/profiles/profile/share/bash-completion/bash_completion
  elif [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  else
    echo "WARNING: no bash_completion script found on system"
  fi
fi

# bash auto-completion for aliases!
source "$HOME/repos/utils/complete-alias/complete_alias"
complete -F _complete_alias "${!BASH_ALIASES[@]}"


#===============================================================================
# colors
#===============================================================================
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

# special color for python scripts
LS_COLORS="$LS_COLORS*.py=1;36:"
export LS_COLORS

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# set grep colors
export GREP_COLORS='ms=01;91'


#===============================================================================
# PS1
#===============================================================================
hostname_color='\[\033[01;32m\]'
if [ "$SESSION_TYPE" == "remote/ssh" ] ; then
    hostname_color='\[\033[01;95m\]'
fi

last_command_return_value() {
    printf "[$?]"
}

# Add git branch if its present to PS1
get_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$sysname_short" == "lin" ] ; then
    ps1_sysname=''
else
    ps1_sysname="$sysname_short "
fi

PS1_end_string=$(printf "\n$ ")

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@'"$hostname_color"'\h\[\033[01;90m\] $ps1_sysname\[\033[00m\]\[\033[01;33m\]\w\[\033[00m\] $(last_command_return_value) \[\033[01;36m\]$(get_git_branch) \[\033[00m\]$PS1_end_string'
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h \w $(last_command_return_value) $(get_git_branch)$PS1_end_string'
fi
unset color_prompt


#===============================================================================
# closing statements
#===============================================================================
# and the end of all our exploring
# will be to arrive where we started
# and know the place for the first time
cd "$start_directory"
unset verbose

# p.s. it's nice to start git-bash at home
if [ "$sysname" = windows ]; then
    if [ "$start_directory" = "/" ]; then
        cd
    fi
fi


#===============================================================================
# command history
#===============================================================================
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash --disable-up-arrow)"
