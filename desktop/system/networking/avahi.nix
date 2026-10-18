{ ... }: {

  # Required to discover devices in my homelab
  # TODO: At some point, adjust this to have full mDNS resolution
  # in other words, no need for .local
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;

  };
}
