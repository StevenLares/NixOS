{ ... }: {
  imports = [
    ./browsers
    ./development
    ./file-system-mounting
    ./messaging
    ./music-production
    ./office
    ./redundancy
    ./vpn

    ./gelly.nix
    ./keepassxc.nix
    ./obsidian.nix
  ];

}
