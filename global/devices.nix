{

  #TODO: Fill them out
  acer-e15-laptop = {
    static-ip = "";
    tailscale-ip = "";
    syncthing-device-id = "";
    type = "pc";
    form-factor = "laptop";
  };

  nuc-desktop = {
    static-ip = "";
    tailscale-ip = "";
    syncthing-device-id = "";
    type = "pc";
    form-factor = "desktop";
  };

  ####### These are not directly managed by this lab
  ####### They are included to make Syncthing easier to manage
  pixel-6a = {
    static-ip = "";
    tailscale-ip = "";
    syncthing-device-id = "";
    type = "other";
    form-factor = "phone";
  };
  ####### End of these non-managed devices ##################

  ####### Start of VMs ##################

  local-backup-VM = {
    static-ip = "";
    tailscale-ip = "";
    syncthing-device-id = null;
    type = "server";
    ports = { };
  };
  network-adblocker-VM = {
    static-ip = "";
    tailscale-ip = "";
    syncthing-device-id = null;
    type = "server";
    ports = {
      dashboard = 8089;
    }; # TODO:
  };
  private-web-services-VM = {
    static-ip = "";
    tailscale-ip = "";
    syncthing-device-id = null;
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
    static-ip = "";
    tailscale-ip = "";
    syncthing-device-id = null;
    type = "server";
    ports = { }; # TODO:
  };
  syncthing-hub-VM = {
    static-ip = "";
    tailscale-ip = "";
    syncthing-device-id = "";
    type = "server";
    ports = { }; # TODO:
  };
  tailscale-exit-node-VM = {
    static-ip = "";
    tailscale-ip = "";
    syncthing-device-id = null;
    type = "server";
    ports = [ { } ];

  };

}
