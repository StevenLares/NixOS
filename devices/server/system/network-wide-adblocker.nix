{ ... }: {

  #TODO: Set hostname

  services.pihole-ftl = {
    enable = true;

    #TODO: Add blocklists

  };

  services.pihole-web = {
    enable = true;
    ports = [ "443s" ];
  };

}
