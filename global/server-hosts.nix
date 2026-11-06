{

  adblocker-VM = {
    ports = {
      pihole-dashboard = 80;
    };
  };

  local-backups-VM = { };

  private-web-services-VM = {
    ports = {
      kavita = 5000;
      readeck = 5270;
      multiflux = 49999;
      jellyfin = 8096;
      navidrome = 4533;
    };
  };

  software-forge-VM = {
    ports = {
      forgejo-dashboard = 80;
    };
  };

  tailscale-exit-node-VM = { };

}
