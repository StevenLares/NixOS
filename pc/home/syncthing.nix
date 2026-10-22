{ ... }: {

  # Originally, this was system-wide. However, I moved it here since I use syncthing exclusively on the user-level, and frankly I don't want to configure another set of credentials.
  # Obviously, this is a single-user PC concern. This will be a different story on the 'hub' syncthing server.
  #TODO: keep configuring this at some point. Maybe just configure the folder paths, without the rest of provisioning on this side
  # Why? Think about what it would mean to pull this repo on a new machine

  services.syncthing = {
    enable = true;

    settings.options = {
      globalAnnounceEnabled = false;
      localAnnounceEnabled = true;
      natEnabled = false;
      relaysEnabled = false;
      urAccepted = 0;
    };
  };
}
