#!/usr/bin/bash

set -e

# this script ensures this file exists
DPI=$(dpi-get)
file="$HOME/.Xresources"
bat "$file"
echo "Choose DPI (multiples of 96 preferred)"
select dpi in "96" "192" "288"; do
    DPI="$dpi"
    echo "selected $DPI"
    len=$(echo -n "$dpi" | wc -m)
    echo "len of dpi string is $len"
    if (( $len < 2 )); then
        echo "invalid selection!"
        exit 1
    fi
    break;
done

sed -i "s/Xft.dpi:.*/Xft.dpi: $DPI/" "$file"
bat "$file"
echo -n "running dpi-get to make sure that still works: "
echo $(dpi-get)
bat "$file"
echo "edit ~/.Xresources to set custom DPI"
echo "Re-login to update DPI environment variable for all processes"
