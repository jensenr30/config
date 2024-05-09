{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    can-utils
    dfu-util
    openocd
    gcc-arm-embedded
    # TODO
    # newlib
    # newlib-nano
    minicom
    bear

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
