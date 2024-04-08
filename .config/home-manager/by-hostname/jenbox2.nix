{ config, pkgs, ... }:

{
  imports = [
    ../cli.nix
    ../gui.nix
    ../embedded-systems.nix
    ../workstation.nix
  ];
}
