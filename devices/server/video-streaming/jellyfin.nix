{ ... }: {

  #TODO: change port
  services.jellyfin = {
    enable = true;
    hardwareAcceleration.enable = true;
    hardwareAcceleration.type = "vaapi";
    openFirewall = true;
  };
}
