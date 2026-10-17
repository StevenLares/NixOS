{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      commonDesktopModules = [
        ./desktop/system

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
