{ ... }:
{

  # This folder is about backups, syncronization, and anything else along those lines
  # Stuff that home-manager isn't really supposed to do (you won't git commit your private to a public git repo, for example)
  imports = [
    ./duplicacy.nix
    ./restic.nix
    ./syncthing.nix
  ];
}
