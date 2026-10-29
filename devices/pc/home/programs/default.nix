{ ... }: {
  imports = [
    ./browsers
    ./communication
    ./development
    ./file-system-mounting
    ./gaming
    ./music-production
    ./office
    ./redundancy
    ./vpn

    ./gelly.nix
    ./keepassxc.nix
    ./obsidian.nix
  ];

}
