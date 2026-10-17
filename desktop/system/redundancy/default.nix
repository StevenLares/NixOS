{ ... }:
{

  # This folder is about backups, syncronization, and anything else along those lines
  imports = [
    ./duplicacy.nix
    ./git.nix
    ./restic.nix
    ./syncthing.nix
  ];
}
