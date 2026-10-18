{ ... }: {

  # Originally, this was system-wide. However, I moved it here since I use syncthing exclusively on the user-level, and frankly I don't want to configure another set of credentials.
  services.syncthing = {
    enable = true;

  };
}
