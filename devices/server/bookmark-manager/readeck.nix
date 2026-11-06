{ ... }: {

  services.readeck = {
    enable = true;

    # TODO: more settings found at:
    # https://readeck.org/en/docs/configuration
    settings = {
      port = 80;
    };

  };

}
