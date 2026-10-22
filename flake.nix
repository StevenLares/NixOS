{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.8.0";

    #TODO: update your README.md on how to add new desktop
    #TODO: Anything from 'pre-nix migration' recovery folder to add?
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

      # Used by by server and client
      self-hosted-ports = {
        syncthing-server_port = "43121";
        syncthing-client_port = "8384";
        syncthing-forwarded_port = "9988";
        full-text-rss_port = "50000";
        rss-bridge_port = "3001";
        jellyfin_port = "8096";
        kavita_port = "5000";
        fresh-rss_port = "49999";
        navidrome_port = "4533";
        linkding_port = "5270";
        forgejo_port = "3000";
      };

      # Used by by server and client
      syncthing-paths = rec {
        base = "~/Synced";
        cryfs = base ++ "/CryFs";
        gocryptfs = base ++ "/GoCryptFs";
        keepassxc = base ++ "/KeepassXC";
        music-production = base ++ "/Music Production";
        obsidian = base ++ "/Obsidian";
        save-game-data = base ++ "/Save Game Data";
      };

      # Single user system on all devices
      username = "steven";

      #TODO: adjust this, since this is more specific to the clone-like nature of desktops
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

            ./${device_type}/system

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
              home-manager.users.${username} = import ./${device_type}/home;
            }

          ];
        };
    in
    {
      nixosConfigurations = {
        acer-e15-laptop = mkHost {
          device_type = "desktop";
          host = "acer-e15-laptop";
        };
        nuc-desktop = mkHost {
          device_type = "desktop";
          host = "nuc-desktop";
        };
      };
    };
}
