#!/bin/bash
set -e

source install-helper.sh

$i keyd
keymap --reload
$sys enable --now keyd.service
