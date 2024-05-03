{ config, pkgs, ... }:

{
  home.packages = with pkgs; [

# internet
tor-browser
# fonts are not right in firefox (or nix?)
# firefox
qbittorrent

# office
# fbreader
xournalpp # annotating PDFs and adding signatures.
libreoffice
hunspell # libre office (spell check)
hunspellDicts.en-us

# fonts
inconsolata-nerdfont

# media editing
# weird problems running from dolphin???
# gimp
inkscape
audacity
kdenlive
obs-studio
# TODO install in arch script?  or here?
# v4l2loopback-dkms
simplescreenrecorder
# gcolor2
gcolor3
xf86_input_wacom

# cd ripping
abcde
glyr
flac
cdparanoia
lame
opusTools
vorbisgain

# TODO: move to programming.nix
# # programming
# visual-studio-code-bin
# gnome-keyring # for vs code
# #rustc  # TODO: fix this
# #cargo
# $p pre-commit
# python-pdm
# doxygen
# # graphics / game / networking
# sdl2 sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf
# emscripten
# nng

# C
# gdb
check
cppcheck
lcov
gnumake
cmake
clang
# multilib-devel   # 32-bit libraries for compiling for ARM etc.
openocd
bear # used generate compilation database for clang tooling


# for building unity tests
ruby

# CAD
freecad
kicad
# --asdeps kicad-library kicad-library-3d

#===============================================================================
# misc
#===============================================================================
discord
fsearch
piper
qdirstat
shutter
wine

# benchmarking
geekbench

# usbtop

# via (keyboard customization)
via

# etcher
virtualbox

# game dev
# nng

# TODO: configure this in top level?
# #===============================================================================
# # themes
# #===============================================================================
# $flat flathub org.kde.KStyle.Adwaita
# lxappearance || lxappearance-gtk3
# qt5ct qt6ct
# gnome-themes-extra
# # TODO: is this necessary?  -git?  can't i just get these from the arch repos?
# adwaita-qt4 adwaita-qt5-git adwaita-qt6-git
# papirus-icon-theme

  ];
}
