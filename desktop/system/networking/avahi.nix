{ ... }: {

  # Required to discover devices in my homelab
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;

  };
}
