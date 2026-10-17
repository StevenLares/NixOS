{ pkgs, ... }:
{
  imports = [
    ./development
    ./nix
    ./redundancy

    ./audio.nix
    ./browsers.nix
    ./communication.nix
    ./flatpak.nix
    ./gaming.nix
    ./hardware.nix
    ./i18n.nix
    ./kde.nix
    ./music-player.nix
    ./music-production.nix
    ./networking.nix
    ./notetaking.nix
    ./office.nix
    ./printing.nix
    ./ssh.nix
    ./users.nix
    ./vpn.nix
  ];

  # Reasonable default for packages. I think some of these are actually critical
  environment.systemPackages = with pkgs; [
    vim
    wget
    git

  ];

}
