{ pkgs, ... }:
{
  imports = [
    ./development
    ./editors
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
    ./ssh.nix
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
