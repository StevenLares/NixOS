{ ... }:
{
  imports = [
    ./editors
    ./hardware
    ./networking
    ./nix

    ./audio.nix
    ./communication.nix
    ./flatpak.nix
    ./gaming.nix
    ./i18n.nix
    ./kde.nix
    ./notetaking.nix
    ./office.nix
    ./printing.nix
    ./users.nix
    ./userspace-encryption.nix

    # TODO: Comment this out when you are done testing virtualization stuff
    ./virtualization.nix
  ];

}
