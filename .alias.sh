#!/usr/bin/bash


################################################################################
#         Print the Definition of Any Aliase, Function, or Script!             #
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

alias rlal='source $HOME/.alias.sh'         # ReLoad ALiases
alias ea="e $HOME/.alias.sh && rlal"        # Edit Aliases


################################################################################
#                               GNU / Linux                                    #
################################################################################

# quick cd into install script directories
alias cdi="cd $CFGDIR/install"
alias cdid="cd $CFGDIR/install/$distro"
# quick cd into nas storage
alias cdn='cl /nas/safe'
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
alias f='fd --hidden --no-ignore --ignore-case --one-file-system --full-path'
alias cdf='cd $(fz) && lv'
# fuzzy find in your command history :)
alias fh='history | sed "s/ *[0-9]* *//" | rpj-fzf --tac +s | tee >(tr -d "\n" | clipin)'

# greps
alias grep='grep --color=auto '
alias g='grep'
alias gi='g -i'
alias psg="ps -A | grep -i"

# misc *nix
alias dtop='sudo dmesg -wH'
alias k9='killall -9'
alias mkdir="mkdir -p"
alias path='echo $PATH | tr ":" "\n"'
alias rm='rm -d'
alias sl='screen -list'
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
#                                    C                                         #
################################################################################
alias m='make'
#alias m="make -j $(nproc)"
alias makenew='make clean && m'
alias bmake="bear -- make" # generates compile_commands.json for clangd
alias vg='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --log-file=valgrind-out.txt'
alias mf='m && flash'
alias mt='m test && cp test/build/compile_commands.json compile_commands.json'


################################################################################
#                                    git                                       #
################################################################################
alias k='gitk --all --full-history --select-commit=$(mit) & disown'
alias gh='gittyup .'
alias s="git status"
alias ga='git add'
alias gr='git reset'
alias a="ga -A;s"
alias gf='git fetch'
alias ags='a; git stash'
alias c="git commit"
alias b="git branch"
alias ch="git checkout"
alias chm='ch main || ch master'
alias chowmain="chm && pulp"
alias remain='git rebase main'
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
# move to the top-level directory of the current git repo
alias cdr='cd $(git rev-parse --show-toplevel)'


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
#                             home networking                                  #
################################################################################
alias nas="ssh ryan@server"


################################################################################
#                                redacted                                      #
################################################################################
alias ed='echo DEBUG = $DEBUG; echo DEVKIT = $DEVKIT; echo ELF_FILE = $ELF_FILE'
alias ed0='unset DEBUG; ed'
alias ed1='export DEBUG=1; ed'
alias eddev='export DEVKIT=1; export ELF_FILE="build/app/app"; ed1'
alias edc='unset DEBUG; unset DEVKIT; unset ELF_FILE; ed'
alias dgt='dronecan_gui_tool &'


################################################################################
#                               Arch Linux                                     #
################################################################################
# this shouldn't be necessary... oh well
if [ "$distro" == "arch" ]; then
    alias neofetch='neofetch --ascii_distro Arch'
fi


################################################################################
#                                 Windows                                      #
################################################################################
if [ $sysname == "windows" ]; then
    alias lsu='usbipd wsl list | tee >(wc)'
    unalias ls
    alias ls='ls --color=auto --group-directories-first'
fi
