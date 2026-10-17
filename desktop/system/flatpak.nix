{ pkgs, ... }:
{
  #I guess if you add nix-flatpak, you can add more this file
  environment.systemPackages = with pkgs; [
    flatpak
  ];
}
