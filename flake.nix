{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.8.0";

    #TODO: update your README.md on how to add new PCs
    #TODO: Anything from 'pre-nix migration' recovery folder to add?
    #TODO: Maybe add this?: https://github.com/NotAShelf/wallpkgs
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-flatpak,
      ...
    }:
    let
      central-server_ip = "nuc-home-server";
      dietpi-server_ip = "192.168.0.152";

      #TODO: currently unused
      hosts = import ./shared-configs/hosts.nix;

      # Used by server and client
      self-hosted-ports = import ./shared-configs/self-hosted-ports.nix;

      # Used across multiple modules, since syncing this across clients is central to my workflow
      syncthing-paths = import ./shared-configs/syncthing-paths.nix;

      # Single user system on all devices
      username = "steven";

      #TODO: adjust this, since this is more specific to the clone-like nature of desktops
      #TODO: could have a separate server one
      mkHost =
        { device_type, host }:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit host;
            inherit central-server_ip;
            inherit dietpi-server_ip;
            inherit self-hosted-ports;
            inherit syncthing-paths;
            inherit username;
          };

          modules = [

            nix-flatpak.nixosModules.nix-flatpak

            home-manager.nixosModules.home-manager

            ./devices/${device_type}/system

            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit host;
                inherit central-server_ip;
                inherit dietpi-server_ip;
                inherit self-hosted-ports;
                inherit syncthing-paths;
                inherit username;
              };
              home-manager.users.${username} = import ./devices/${device_type}/home;
            }

          ];
        };
    in
    {
      nixosConfigurations = {
        acer-e15-laptop = mkHost {
          device_type = "pc";
          host = "acer-e15-laptop";
        };
        nuc-desktop = mkHost {
          device_type = "pc";
          host = "nuc-desktop";
        };
      };
    };
}
