{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.8.0";

    #TODO: Add impermanence once you get backups set up.
    #TODO: Add 'injectable values', after you add server stuff
    #TODO: Add nix-pak, which allows you to harden specific apps
    #TODO: Add secrets provisioning, either sops or agenix
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-flatpak,
      ...
    }:
    let
      commonDesktopModules = [
        ./desktop/system

        nix-flatpak.nixosModules.nix-flatpak

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.steven = import ./desktop/home;
        }
      ];

      mkDesktopHost =
        host:
        nixpkgs.lib.nixosSystem {
          modules = commonDesktopModules ++ [
            (./desktop/device-specific + "/${host}")
          ];
        };
    in
    {
      nixosConfigurations = {
        acer-e15-laptop = mkDesktopHost "acer-e15-laptop";
        nuc-desktop = mkDesktopHost "nuc-desktop";
      };
    };
}
