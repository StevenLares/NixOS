{ ... }: {

  # Originally, this was system-wide. However, I moved it here since I use syncthing exclusively on the user-level, and frankly I don't want to configure another set of credentials.
  # Obviously, this is a single-user desktop concern. This will be a different story on the 'hub' syncthing server.
  #TODO: keep configuring this at some point. Think, automatic provisioning.
  services.syncthing = {
    enable = true;

  };
}
