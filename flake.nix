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
    {
      nixpkgs,
      home-manager,
      nix-flatpak,
      ...
    }:
    let
      inherit (import ./global/to-deprecate/central-server_ip.nix) central-server_ip;
      inherit (import ./global/to-deprecate/dietpi-server_ip.nix) dietpi-server_ip;

      # Used by server and client
      self-hosted-ports = import ./global/to-deprecate/self-hosted-ports.nix;

      # Used across multiple modules, since syncing this across clients is central to my workflow
      syncthing-folders = import ./global/syncthing-folders.nix;

      pc-hosts = import ./global/pc-hosts.nix;
      unmanaged-hosts = import ./global/unmanaged-hosts.nix;
      inherit (import ./global/server-hostnames.nix) server-hostnames;

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

                  # flatpak is configured in home, so needed here
                  nix-flatpak

                  # Needed for syncthing
                  syncthing-folders

                  pc-hosts
                  unmanaged-hosts
                  server-hostnames
                  ;
              };
              home-manager.users.${username} = import ./devices/pc/home;
            }

          ];
        };

      mkServer =
        host:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              host
              username

              server-hostnames
              ;
          };

          modules = [ ./devices/server ];
        };
    in
    {
      nixosConfigurations = {
        acer-e15-laptop = mkPC "acer-e15-laptop";
        nuc-desktop = mkPC "nuc-desktop";

        adblocker-VM = mkServer "adblocker-VM";
        bookmark-manager-VM = mkServer "bookmark-manager-VM";
        cloud-gaming-VM = mkServer "cloud-gaming-VM";
        e-reader-VM = mkServer "e-reader-VM";
        local-backups-VM = mkServer "local-backups-VM";
        music-streaming-VM = mkServer "music-streaming-VM";
        rss-feed-VM = mkServer "rss-feed-VM";
        software-forge-VM = mkServer "software-forge-VM";
        tailscale-exit-node-VM = mkServer "tailscale-exit-node-VM";
        video-streaming-VM = mkServer "video-streaming-VM";
      };
    };
}
