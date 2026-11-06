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

  pixel-6a = {
    static-ip = "";
    tailscale-ip = "";
    syncthing-device-id = "";
    type = "other"; # not directly managed by this lab
    form-factor = "phone";
  };

  local-backup-VM = {
    static-ip = "";
    tailscale-ip = "";
    type = "server";

  };
  network-wide-adblocker-VM = {
    static-ip = "";
    tailscale-ip = "";
    type = "server";
    ports = { }; # TODO:
  };
  private-web-servers-VM = {
    static-ip = "";
    tailscale-ip = "";
    type = "server";
    ports = { }; # TODO:
  };
  software-forge-VM = {
    static-ip = "";
    tailscale-ip = "";
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
    type = "server";

  };

}
