#!/usr/bin/sh

# put this string in your .bashrc file on its own line: "source ~/.alias"

# R.L.A.L. ReLoad ALiases
alias rlal='source $HOME/.alias.sh'
# E.A. - Edit Aliases (also, challenge everything)
alias ea="e $HOME/.alias.sh && rlal"

################################################################################
# git
################################################################################
alias fp='git fetch --prune'
alias k='gitk --all --full-history --select-commit=$(mit) & disown'
alias gh='gittyup .'
alias kdo='gitk --all --date-order --full-history --select-commit=0000000000000000000000000000000000000001 & disown'
alias s="git status"
alias ga='git add'
alias gr='git reset'
alias gra='git reset --all'
alias a="ga -A;s"
alias ags='a; git stash'
alias c="git commit"
alias cm='git commit -m'
alias b="git branch"
alias ch="git checkout"
alias chowmain="ch main || ch master && pulp"
alias remain='git rebase main'
alias pull="git pull"
alias pulp='git pull --prune'
alias push="git push"
alias pfwl="git push --force-with-lease"
alias pushsu='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias pp="s;line;pull;push;line;s"
alias pulpm="ch main && pulp || ch master && pulp"
alias gm='git merge'
alias gms='git maintenance start'

# You will not miss this "WIP" commit when looking at your git history - I guarantee it
alias wip='c -m "WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP"'

# the "do everything" command - protip: don't use this at work
alias gitslam="a; c -m 'gitslam!'; line; pull; push; line; s"
alias gd="git diff"

alias giturl="git remote get-url origin | tee >(clipin)"
alias gsui='git submodule update --init --recursive'
alias rebase='git rebase'
alias grc='git rebase --continue'
alias gcpc='git cherry-pick --continue'
alias mvb='git branch --force' # <branch-name> [<new-tip-commit>]

################################################################################
# GNU / Linux
################################################################################
# There are so many god damn aliases and scripts, it can get confusing.
# This function tells you what the alias OR script does.
function bw(){
    if alias "$1" &>/dev/null; then     # If the alias exists:
        alias "$1"                          # print it
    else                                # otherwise
        bat $(which "$1")                   # it's probably a script - try to find & print it
    fi
}

# misc
alias path='echo $PATH | tr " " "\n"'

alias gdir="dolphin --new-window . & disown"

# quick cd into install script directories
alias cdi="cd $CFGDIR/install"
alias cdid="cd $CFGDIR/install/$distro"
# quick cd into nas storage
alias cdn='cl /nas/safe'
# move to the top-level directory of the current git repo
alias cdr='cd $(git rev-parse --show-toplevel)'

# quickly jump up N directories
# what's nice about this is that it allows `cd -` to work as expected  :)
function cu(){
    if [ $# -eq 0 ]; then
        ascend=1;
    else
        ascend=$1;
    fi
    local path=""
    for ((i=1;i<=$ascend;i++)); do
        path="../$path"
    done
    cd "$path"
}

# my weirdo ls aliases
alias ls='exa --color=automatic --group-directories-first'
alias l='ls'
alias l1='ls -1'
alias l1a='l1 -a'
alias l1='ls -1'
alias l1a='l1 -a'
alias la='ls -a'
alias lv='ls -lh'
alias lva='lv -a'

# cd into a directory and immediately print the contents
function cl(){
    cd $1 && la
}

# ls-type commands for non-directories
alias lsuuid='sudo blkid | grep -i UUID='
alias lsnet="sudo arp-scan -l"
alias lsb='lsblk -o NAME,SIZE,FSUSE%,LABEL,MOUNTPOINT'
alias lss='ls /dev/serial/by-id/'

# make directoy, then cd into it
mkcd() {
    # if the directory does not exist, make it.
    test -d "$1" && echo "directory $1 already existed.  Entering it..."
    test -d "$1" || mkdir -p "$1"
    test -d "$1" && cd "$1"
}

#finders
alias fd='fd --hidden --no-ignore --ignore-case'
alias sd='cd $(fz) && lv'
alias fh='history | sed "s/ *[0-9]* *//" | rpj-fzf --tac +s | tr -d "\n" | tee >(clipin)'

# greps
alias grep='grep --color=auto '
alias gi='grep -i'

alias psg="ps -A | grep -i"

alias dtop='sudo dmesg -wH'
alias sl='screen -list'
alias rm='rm -d'
alias mkdir="mkdir -p"
alias k9='killall -9'

alias w='watch -n 0.1 --color'

# PDF diff viewer
function pdfd() {
    filename="diff-pdf.pdf"
    if test -f "$filename"; then
        rm $filename
    fi
    diff-pdf -g -m -s --output-diff="$filename" "$1" "$2" && echo "success! opening pdf..."
    pdf "$filename"
}

alias o='xdg-open'

################################################################################
# Windows
################################################################################
if [ $sysname == "windows" ]; then
    alias lsu='usbipd wsl list | tee >(wc)'
    unalias ls
    alias ls='ls --color=auto --group-directories-first'
fi

################################################################################
# sha
################################################################################
alias sha1='sha1sum'
alias sha224='sha224sum'
alias sha256='sha256sum'
alias sha384='sha384sum'
alias sha512='sha512sum'
alias sha='shasum'


################################################################################
# python
################################################################################
alias py="python"
alias py3="python3"


################################################################################
# C
################################################################################
alias m='make'
#alias m="make -j $(nproc)"
alias makenew='make clean && m'
alias bmake="bear -- make" # generates compile_commands.json for clangd
alias vg='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --log-file=valgrind-out.txt'
alias mf='m && flash'
alias mt='m test && cp test/build/compile_commands.json compile_commands.json'

################################################################################
# home networking
################################################################################
alias nas="ssh ryan@server"

################################################################################
# Arch
################################################################################
alias pacown='pacman -F "$1"'

################################################################################
# PD
################################################################################
alias ed='echo DEBUG = $DEBUG; echo DEVKIT = $DEVKIT; echo ELF_FILE = $ELF_FILE'
alias ed0='unset DEBUG; ed'
alias ed1='export DEBUG=1; ed'
alias eddev='export DEVKIT=1; export ELF_FILE="build/app/app"; ed1'
alias edc='unset DEBUG; unset DEVKIT; unset ELF_FILE; ed'
alias dgt='dronecan_gui_tool &'

