{ ... }: {

  # Occasionally I might have symlinks from a dot folder to something in ~/Synced or elsewhere
  # This is where I'll do that

  imports = [
    ./fonts.nix
    ./gaming.nix
    ./music-production.nix
  ];

}
