{ ... }: {

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Needed for Niri, instead of the other ssh agent
  # While Niri provides this, I'm adding it here to be explicit
  services.gnome.gcr-ssh-agent.enable = true;
}
