{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.8.0";

  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nix-flatpak,
      ...
    }:
    let
      inherit (import ./global/to-deprecate/central-server_ip.nix) central-server_ip;
      inherit (import ./global/to-deprecate/dietpi-server_ip.nix) dietpi-server_ip;

      pc-home-paths = import ./global/pc-home-paths.nix;

      # Used by server and client
      self-hosted-ports = import ./global/to-deprecate/self-hosted-ports.nix;

      # Used across multiple modules, since syncing this across clients is central to my workflow
      syncthing-paths = import ./global/syncthing-paths.nix;

      devices = import ./global/devices.nix;

      # Single user system on all devices
      inherit (import ./global/username.nix) username;

      mkPC =
        host:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              host
              username

              #flatpak runtime is needed system-wide
              nix-flatpak

              ;
          };

          modules = [

            nix-flatpak.nixosModules.nix-flatpak

            ./devices/pc/system

            home-manager.nixosModules.home-manager

            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit
                  host
                  username

                  #TODO: Needed pre-Nix migration, will remove later
                  central-server_ip
                  dietpi-server_ip

                  #TODO: Needed pre-Nix migration, will remove later
                  self-hosted-ports

                  # Needed for ~ creation
                  pc-home-paths

                  # flatpak is configured in home, so needed here
                  nix-flatpak

                  # Needed for syncthing
                  syncthing-paths
                  devices
                  ;
              };
              home-manager.users.${username} = import ./devices/pc/home;
            }

          ];
        };

      #TODO:
      mkServer =
        host:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              host
              username

              devices
              ;
          };

          modules = [

            ./devices/server/system

            home-manager.nixosModules.home-manager

            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit
                  host
                  username

                  # Needed for syncthing hub
                  syncthing-paths
                  devices
                  ;
              };
              home-manager.users.${username} = import ./devices/pc/home;
            }

          ];
        };
    in
    {
      nixosConfigurations = {
        acer-e15-laptop = mkPC "acer-e15-laptop";
        nuc-desktop = mkPC "nuc-desktop";
      };
    };
}
