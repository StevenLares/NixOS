{ nix-flatpak, ... }: {
  imports = [
    ./browsers
    ./communication
    ./gaming
    ./music-production
    ./office
    ./redundancy
    ./vpn

    ./flatpak.nix
    ./gelly.nix
    ./keepassxc.nix
    ./obsidian.nix
  ]
  ++ [ nix-flatpak.homeManagerModules.nix-flatpak ];

}
