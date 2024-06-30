{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    can-utils
    dfu-util
    openocd
# there was some python issue when trying to run gdb so for now use arch or native
#    gcc-arm-embedded
    # TODO
    # newlib
    # newlib-nano
    minicom

    # TODO install dronecan gui via nix... someday...
    # can-utils
    # # this is for dronecan_gui_tool:
    # python-pip python-setuptools python-wheel
    # python-numpy python-pyqt5
    # --asdeps qt5-svg
    # $p dronecan
    # $p git+https://github.com/DroneCAN/gui_tool@master
  ];
}
