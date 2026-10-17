{ pkgs, ... }:
{
  imports = [
    ./astronvim.nix
    ./audio.nix
    ./duplicacy.nix
    ./experimental-features.nix
    ./flatpak.nix
    ./gaming.nix
    ./garbage-collection.nix
    ./hardware.nix
    ./kde.nix
    ./i18n.nix
    ./music-production.nix
    ./networking.nix
    ./ssh.nix
    ./syncthing.nix
    ./users.nix
    ./vpn.nix
  ];

  # The below are not found in separate files, since I didn't want to clutter up the folder

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Reasonable default for packages. I think some of these are actually critical
  environment.systemPackages = with pkgs; [
    vim
    wget
    git

  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
