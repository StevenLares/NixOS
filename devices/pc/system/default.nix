{ ... }:
{
  imports = [
    ./desktop-environments
    ./editors
    ./fonts
    ./hardware
    ./networking
    ./nix
    ./utilities

    ./audio.nix
    ./flatpak.nix
    ./i18n.nix
    ./kde.nix
    ./printing.nix
    ./users.nix

    # TODO: Comment this out when you are done testing virtualization stuff
    ./virtualization.nix
  ];

}
