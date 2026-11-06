{

  #TODO: Fill them out
  acer-e15-laptop = {
    syncthing-device-id = "";
    type = "pc";
    form-factor = "laptop";
  };

  nuc-desktop = {
    syncthing-device-id = "";
    type = "pc";
    form-factor = "desktop";
  };

  ####### These are not directly managed by this lab
  ####### They are included to make Syncthing easier to setup
  pixel-6a = {
    syncthing-device-id = "";
    type = "unmanaged";
    form-factor = "phone";
  };
  ####### End of these non-managed devices ##################

  ####### Start of VMs ##################

  local-backup-VM = {
    type = "server";
  };
  network-adblocker-VM = {
    type = "server";
    ports = {
      pihole-dashboard = 80;
    };
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
  syncthing-hub-VM = {
    syncthing-device-id = "";
    type = "server";
    ports = { }; # TODO:
  };
  tailscale-exit-node-VM = {
    type = "server";

  };

}
