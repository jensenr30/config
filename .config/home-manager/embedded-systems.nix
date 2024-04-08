{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    dfu-util
    openocd
    # gcc-arm-embedded
    # newlib
    # newlib-nano
    minicom
    can-utils
  ];
}
