# TODO: 
  # TODO: Need to add the rest of the settings
  # TODO: Maybe extract out common settings

  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "Default";
      id = 0;
      isDefault = true;
      settings = {
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.recentsearches" = false;
        "browser.urlbar.suggest.sponsored" = false;
      };
      search = {
        force = true;
        engines = {
          no-ai-ddg = {
            name = "No AI DuckDuckGo";
            urls = [ { template = "https://noai.duckduckgo.com/?q={searchTerms}"; } ];

          };

          bing.metaData.hidden = true;
          google.metaData.hidden = true;
          perplexity.metaData.hidden = true;
          ebay.metaData.hidden = true;
          wikipedia.metaData.hidden = true;
          ddg.metaData.hidden = true;
        };
        default = "no-ai-ddg";

      };
    };
    profiles.youtube = {
      name = "Youtube";
      id = 1;
    };
    profiles.tv = {
      name = "TV";
      id = 2;
    };
  };
