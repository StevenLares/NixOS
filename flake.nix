{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.8.0";

    #TODO: Adjust notion of device-specific. Perhaps that could be 'device-hardware' (containing boot logic and hardware-config).
    # Then, the rest of the logic gets merged into both system/ and home/ (separated through if statements checking the requesting device)

    #TODO: Add 'injectable values', after you add server stuff. First priority
    #TODO: Add firejail or some other hardening for specific apps. Second priority
    #TODO: Add impermanence once you get backups set up.
    #TODO: Add secrets provisioning, either sops or agenix. Important (and convienent) but not urgent

    #TODO: add the following:
    # home server static ips
    # home server ports for each service
    # desktop static ips
    # syncthing directories
    # keyboard layouts for kmonad

    # TODO: and then of course, remove all hard-coded values to use these ones

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
          specialArgs = { inherit host; };
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
