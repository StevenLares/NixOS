{

  adblocker-VM = {
    type = "server";
    ports = {
      pihole-dashboard = 80;
    };
  };

  local-backups-VM = {
    type = "server";
  };

  private-web-services-VM = {
    type = "server";
    ports = {
      kavita = 5000;
      readeck = 5270;
      multiflux = 49999;
      jellyfin = 8096;
      navidrome = 4533;
    };
  };

  software-forge-VM = {
    type = "server";
    ports = {
      forgejo-dashboard = 80;
    };
  };

  tailscale-exit-node-VM = {
    type = "server";

  };

}
