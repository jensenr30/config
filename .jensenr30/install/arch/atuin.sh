#!/usr/bin/bash

curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh

