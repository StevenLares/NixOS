{ ... }: {

  # Seemingly more settings in home-manager version, and also I want to run this in userspace
  # TODO: might add secret injection here after all

  services.syncthing = {
    enable = true;

    settings.options = {
      globalAnnounceEnabled = false;
      localAnnounceEnabled = true;
      natEnabled = false;
      relaysEnabled = false;
      urAccepted = -1;
    };

  };

}
