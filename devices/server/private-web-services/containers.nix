{ server-hosts, username, ... }: {

  #TODO: Add container logic
  services.jellyfin = {
    enable = true;
    hardwareAcceleration.enable = true;
    hardwareAcceleration.type = "vaapi";
    openFirewall = true;
  };

  #TODO: Add container logic
  services.navidrome = {
    enable = true;

    # TODO: Mostly the logging, schedule, and session timeout stuff from before
    #TODO: Music folder too, apparently
    # settings = {};
    openFirewall = true;

    #TODO: add lastfm secrets
    #TODO: add whatever replaced Spotify
    # environmentFile = {};
  };

}
