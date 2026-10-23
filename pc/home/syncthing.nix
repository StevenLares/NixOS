{ syncthing-paths, ... }:
{

  # Seemingly more settings in home-manager version, and also I want to run this in userspace

  services.syncthing = {
    enable = true;

    settings.options = {
      globalAnnounceEnabled = false;
      localAnnounceEnabled = true;
      natEnabled = false;
      relaysEnabled = false;
      urAccepted = -1;
    };

    # TODO: might add secret injection here after all
    # TODO: Use server for the device, for now
    settings.devices = {

    };

    # TODO: Use server for a guide
    settings.folders = {

      cryfs = {
        enable = true;
        # type =
        path = syncthing-paths.cryfs;
        # label =
        # devices =
        # versioning =
        # ignorePatterns

      };

      gocryptfs = {
        enable = true;
        # type =
        path = syncthing-paths.gocryptfs;
        # label =
        # devices =
        # versioning =
        # ignorePatterns

      };

      keepassxc = {
        enable = true;
        # type =
        path = syncthing-paths.keepassxc;
        # label =
        # devices =
        # versioning =
        # ignorePatterns

      };

      music-production = {
        enable = true;
        # type =
        path = syncthing-paths.music-production;
        # label =
        # devices =
        # versioning =
        # ignorePatterns

      };

      obsidian = {
        enable = true;
        # type =
        path = syncthing-paths.obsidian;
        # label =
        # devices =
        # versioning =
        # ignorePatterns

      };

      save-game-data = {
        enable = true;
        # type =
        path = syncthing-paths.save-game-data;
        # label =
        # devices =
        # versioning =
        # ignorePatterns

      };

    };

  };

}
