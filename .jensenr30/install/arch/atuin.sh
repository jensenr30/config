#!/usr/bin/bash

curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh

echo "Now atuin will have echoed a bunch of shit into your . files - clean that up and re-login to re-source your profile and atuin command will be in your path"
