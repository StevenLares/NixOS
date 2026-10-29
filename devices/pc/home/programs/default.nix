{ ... }: {
  imports = [
    ./browsers
    ./development
    ./file-system-mounting
    ./gaming
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
