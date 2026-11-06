{ ... }: {

  services.navidrome = {
    enable = true;

    # TODO: Mostly the logging, schedule, and session timeout stuff from before
    #TODO: Music folder too, apparently
    # settings = { };
    settings.Port = 80;

    #TODO: add lastfm secrets
    #TODO: add whatever replaced Spotify
    # environmentFile = {};
  };
}
