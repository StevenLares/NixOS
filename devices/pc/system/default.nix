{ ... }:
{
  imports = [
    ./editors
    ./fonts
    ./hardware
    ./networking
    ./nix

    ./audio.nix
    ./flatpak.nix
    ./gaming.nix
    ./i18n.nix
    ./kde.nix
    ./messaging.nix
    ./office.nix
    ./printing.nix
    ./users.nix

    # TODO: Comment this out when you are done testing virtualization stuff
    ./virtualization.nix
  ];

}
