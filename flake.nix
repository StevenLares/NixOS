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
      inherit (import ./global/central-server_ip.nix) central-server_ip;
      inherit (import ./global/dietpi-server_ip.nix) dietpi-server_ip;

      devices = import ./global/devices.nix;

      # Used by server and client
      self-hosted-ports = import ./global/self-hosted-ports.nix;

      # Used across multiple modules, since syncing this across clients is central to my workflow
      syncthing-paths = import ./global/syncthing-paths.nix;

      # Single user system on all devices
      inherit (import ./global/username.nix) username;

      mkPC =
        host:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              host
              central-server_ip
              dietpi-server_ip
              self-hosted-ports
              syncthing-paths
              username
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
                  central-server_ip
                  dietpi-server_ip
                  self-hosted-ports
                  syncthing-paths
                  username
                  nix-flatpak
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

              # Needed for syncthing hub
              syncthing-paths
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
                  central-server_ip
                  dietpi-server_ip
                  self-hosted-ports
                  syncthing-paths
                  username
                  nix-flatpak
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
