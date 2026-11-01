{ ... }: {
  # All of these were close to being system-installed: but ultimately I'm only interested in backing up ~.
  # Everything else is documented in this Nix repo, after all.

  imports = [
    ./duplicacy.nix
    ./restic.nix
    ./syncthing.nix
  ];
}
