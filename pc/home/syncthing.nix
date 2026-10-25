{ syncthing-paths, central-server_ip, ... }:
{

  # Seemingly more settings in the home-manager version, and also I want to run this in userspace

  services.syncthing = {
    enable = true;

    settings.options = {
      globalAnnounceEnabled = false;
      localAnnounceEnabled = true;
      natEnabled = false;
      relaysEnabled = false;
      urAccepted = -1;
    };

    #TODO: will be replaced in the future, as I am moving away from hub and spoke model. Perhaps ID's will be retrieved automatically, somehow
    # Per Syncthing, these ID's are not secrets.
    settings.devices = {
      nuc-home-server = {
        id = "3ZGFWXQ-TVWI4J2-QRSUDQL-XZNTVQT-GQY4EO5-XETUE23-FJPVACI-DEKHRQL";
        name = central-server_ip;
      };
    };

    # TODO: might add secret injection here after all

    # Per Syncthing, these ID's are not secrets and can even be arbitrarly set, as long as they match on both sides (between trusted devices).
    # Thus, anything with a hashed ID is a Syncthing folder I created way before Nix.
    settings.folders = {

      cryfs = {
        enable = true;
        id = "96ovd-cbmfr";
        type = "sendreceive";
        path = syncthing-paths.cryfs;
        label = "CryFs";
        devices = [ central-server_ip ];
        # versioning
        # ignorePatterns

      };

      gocryptfs = {

        enable = true;
        id = "att2y-zysng";
        type = "sendreceive";
        path = syncthing-paths.gocryptfs;
        label = "GoCryptFs";
        devices = [ central-server_ip ];
        # versioning
        # ignorePatterns

      };

      keepassxc = {
        enable = true;
        id = "vzmsp-xdubz";
        type = "sendreceive";
        path = syncthing-paths.keepassxc;
        label = "KeepassXC";
        devices = [ central-server_ip ];
        versioning = {
          type = "simple";
          params.keep = "5";
          params.cleanoutDays = "14";
        };
        # ignorePatterns

      };

      music-production = {
        enable = true;
        id = "psebg-d69yd";
        type = "sendreceive";
        path = syncthing-paths.music-production;
        label = "Music Production";
        devices = [ central-server_ip ];
        versioning = {
          type = "simple";
          params.keep = "5";
          params.cleanoutDays = "14";
        };
        # ignorePatterns

      };

      obsidian = {
        enable = true;
        id = "scvsr-gkybr";
        type = "sendreceive";
        path = syncthing-paths.obsidian;
        label = "Obsidian";
        devices = [ central-server_ip ];
        versioning = {
          type = "simple";
          params.keep = "5";
          params.cleanoutDays = "14";
        };
        # ignorePatterns

      };

      save-game-data = {
        enable = true;
        id = "t4euk-jgktw";
        type = "sendreceive";
        path = syncthing-paths.save-game-data;
        label = "Save Game Data";
        devices = [ central-server_ip ];
        versioning = {
          type = "simple";
          params.keep = "5";
          params.cleanoutDays = "14";
        };
        # ignorePatterns

      };

      #TODO: add fonts

    };

  };

}
