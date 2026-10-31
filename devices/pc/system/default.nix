{ ... }:
{
  imports = [
    ./editors
    ./fonts
    ./hardware
    ./networking
    ./nix

    ./audio.nix
    ./gaming.nix
    ./i18n.nix
    ./kde.nix
    ./printing.nix
    ./users.nix

    # TODO: Comment this out when you are done testing virtualization stuff
    ./virtualization.nix
  ];

}
