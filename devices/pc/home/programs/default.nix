{ nix-flatpak, ... }: {
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
    ./flatpak.nix
    ./keepassxc.nix
    ./obsidian.nix
  ]
  ++ [ nix-flatpak.homeManagerModules.nix-flatpak ];

}
