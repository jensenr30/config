#!/usr/bin/bash

set -e

systemctl daemon-reload
systemctl restart remote-fs.target
tree -L 2 /nas
