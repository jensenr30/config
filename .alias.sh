#!/usr/bin/bash

################################################################################
#         Print the Definition of Any Alias, Function, or Script!             #
################################################################################
# Example: To see what the chowmain command does, run `cw chowmain` in a terminal
function cw()
{
    if alias "$1" &>/dev/null; then
        alias "$1"
        return
    fi
    function_definition=$(declare -f "$1")
    if [ "$function_definition" != "" ]; then
        echo "$function_definition"
    else
        cat $(which "$1")
    fi
}

# pretty version of cw
function bw(){
    if alias "$1" &>/dev/null; then
        cw "$1" | bat --style=plain
        return
    fi
    function_definition=$(declare -f "$1")
    if [ "$function_definition" != "" ]; then
        echo "$function_definition" | bat
    else
        bat $(which "$1") --style full
    fi
}

alias ea="e $HOME/.alias.sh && source $HOME/.alias.sh"        # Edit Aliases


################################################################################
#                                      cd                                      #
################################################################################

# move to the top-level directory of the current git repo
alias cdr='cd $(git rev-parse --show-toplevel)'

# make directoy, then cd into it
mkcd() {
    # if the directory does not exist, make it.
    test -d "$1" && echo "directory $1 already existed.  Entering it..."
    test -d "$1" || mkdir -p "$1"
    test -d "$1" && cd "$1"
}

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

alias cdf='cd $(fz) && lv'

# cd into a directory and immediately print the contents
function cl(){
    cd $1 && lva
}

# quick cd into install script directories
alias cdi="cd $CFGDIR/install"
alias cdid="cd $CFGDIR/install/$distro"
alias tri='cd ~/repos/triangulite && ide'
alias tile='cd ~/repos/tile-venture && ide'
alias exp='cd ~/repos/exp && ide'


################################################################################
#                               GNU / Linux                                    #
################################################################################

# my weirdo ls aliases
alias ls='eza --color=automatic --group-directories-first'
alias l='ls'
alias l1='ls -1'
alias l1a='l1 -a'
alias l1='ls -1'
alias l1a='l1 -a'
alias la='ls -a'
alias lv='ls -lh'
alias lva='lv -a'
alias lvt='lva -s modified'

# ls-type commands for non-directories
alias lsuuid='sudo blkid | grep -i UUID='
alias lsnet="sudo arp-scan -l"
alias lsb='lsblk -o NAME,SIZE,FSUSE%,LABEL,MOUNTPOINT'
alias lss='ls /dev/serial/by-id/'

#finders
alias f='fd --hidden --ignore-case --one-file-system --full-path'
alias fh='history | sed "s/ *[0-9]* *//" | rpj-fzf --tac +s | tee >(tr -d "\n" | clipin)'

# greps
alias grep='grep --color=auto '
alias g='grep'
alias gi='g -i'
alias psg="ps -A | grep -i"

# misc
alias dtop='sudo dmesg -wH'
alias k9='killall -9'
alias o='xdg-open'
alias path='echo $PATH | tr ":" "\n"'
alias pwdc='pwd | tee >(clipin)'
alias rm='rm -d'
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



################################################################################
#                                    C                                         #
################################################################################
#alias m="make -j $(nproc)"
alias makenew='make clean && make'
alias makenewapp='rm -rf build/app; make app'
alias bm="bear -- make" # generates compile_commands.json for clangd
alias vg='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --log-file=valgrind-out.txt'
alias mf='make && flash'
alias t='make test'
alias cleat='clear && make test'
alias mnt='makenew test'
alias mb='make benchmark'
alias cm='clear; make'


################################################################################
#                                    git                                       #
################################################################################
alias k='gitk --all --full-history --select-commit=$(mit) & disown'
alias gh='gittyup .'
alias gd='git diff -U6'
alias gds='DELTA_FEATURES=+side-by-side gd'
alias gdc='gd --cached'
alias gdcs='DELTA_FEATURES=+side-by-side gdc'
alias s="git status"
alias ga='git add'
alias gr='git reset'
alias a="ga -A;s"
alias gf='git fetch'
alias ags='a; git stash'
alias c="git commit"
alias b="git branch"
alias bdr="git push --delete origin"
alias ch="git checkout"
alias chm='ch main || ch master'
alias chowmain="chm && pulp"
alias chowmake='chowmain && makenew'
alias pull="git pull"
alias pulp='git pull --prune'
alias push="git push"
alias pfwl="git push --force-with-lease"
alias pushsu='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias pp="s;line;pull;push;line;s"
alias gms='git maintenance start'
alias wip='c -m "WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP   WIP"'
alias giturl="git remote get-url origin | tee >(clipin)"
alias gsui='git submodule update --init --recursive'
alias rebase='git rebase'
alias grc='git rebase --continue'
alias gcpc='git cherry-pick --continue'


################################################################################
#                                   python                                     #
################################################################################
alias py="python"
alias py3="python3"


################################################################################
#                                    SHA                                       #
################################################################################
alias sha1='sha1sum'
alias sha224='sha224sum'
alias sha256='sha256sum'
alias sha384='sha384sum'
alias sha512='sha512sum'
alias sha='shasum'


################################################################################
#                               networking                                     #
################################################################################
alias nas="ssh ryan@server"
alias tvs='ssh ubuntu@tileventure.crabdance.com'


################################################################################
#                                redacted                                      #
################################################################################
alias menv0='unset DEBUG; menv'
alias menv1='export DEBUG=1; menv'
alias menvdev='export DEVKIT=1; export ELF_FILE="build/app/app"; menv1'
alias menvc='unset DEBUG; unset DEVKIT; unset ELF_FILE; menv'

if [ -f $HOME/pd/.alias.sh ]; then
    . $HOME/pd/.alias.sh
fi


# TODO make these last 2 if statements work in zsh and bash

################################################################################
#                               Arch Linux                                     #
################################################################################
if [ "$distro" == "arch" ]; then
    alias renderdoc='qrenderdoc'
fi


################################################################################
#                                 Windows                                      #
################################################################################
if [ $sysname == "windows" ]; then
    alias lsu='usbipd list'
    alias usba='usbipd attach --wsl -b'
    unalias ls
    alias ls='ls --color=auto --group-directories-first'
fi
