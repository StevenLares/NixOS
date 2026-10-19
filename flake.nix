{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.8.0";

    #TODO: first priority: Add secrets provisioning, either sops or agenix.

    #TODO: second priority: 'injectable values': add the following
    # home server static ips
    # home server ports for each service
    # desktop static ips
    # syncthing directories
    # keyboard layouts for kmonad
    # TODO: and then of course, remove all hard-coded values to use these ones

    #TODO: Add firejail or some other hardening for specific apps.
    #TODO: restic backups, and automation
    #TODO: syncthing automatic provisioning
    #TODO: Finally impermanence once you get backups set up.

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
      ];

      mkDesktopHost =
        host:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit host; };
          modules = commonDesktopModules ++ [
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit host; };
              home-manager.users.steven = import ./desktop/home;
            }
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
