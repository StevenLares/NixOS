{ config, pkgs, ... }:
{
  imports = [
    ./astronvim.nix
    ./syncthing.nix
  ];
}
