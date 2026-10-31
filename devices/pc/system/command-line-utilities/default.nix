{ ... }: {

  # Any command line utility that isn't important enough to be installed system-wide, can just be pulled using nix-shell
  imports = [
    ./development
    ./file-system-mounting
  ];
}
