{ pkgs, ... }:
{
  imports = [
    ./astronvim.nix
    ./duplicacy.nix
    ./experimental-features.nix
    ./flatpak.nix
    ./garbage-collection.nix
    ./kde.nix
    ./localization.nix
    ./networking.nix
    ./sound.nix
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
