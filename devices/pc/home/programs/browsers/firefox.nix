{
  lib,
  central-server_ip,
  self-hosted-ports,
  ...
}:

# TODO: Maybe a flake that pulls in the Quantum style?

let

  # This is placed here as it is reused in http allow list
  # Note that the function was removed; it seemed to give very little gain tbh

  homelabServices = [
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.forgejo_port}";
      name = "Forgejo";
    }
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.fresh-rss_port}";
      name = "Fresh RSS";
    }
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.full-text-rss_port}";
      name = "Full Text RSS";
    }
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.jellyfin_port}";
      name = "Jellyfin";
    }
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.kavita_port}";
      name = "Kavita";
    }
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.linkding_port}";
      name = "Linkding";
    }
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.navidrome_port}";
      name = "Navidrome";
    }
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.rss-bridge_port}";
      name = "RSS-Bridge";
    }
    {
      url = "localhost:${self-hosted-ports.syncthing-client_port}";
      name = "Syncthing (self)";
    }
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.syncthing-forwarded_port}";
      name = "Syncthing (forward from server)";
    }

  ];

  Bookmarks = {
    ManagedBookmarks = [
      { toplevel_name = "Nix Managed Bookmarks"; }
      {
        name = "Homelab";
        children = homelabServices;
      }

      {
        name = "Organization";
        children = [
          {
            url = "https://mail.proton.me";
            name = "Proton Mail";
          }
          {
            url = "https://calendar.proton.me";
            name = "Proton Calendar";
          }
        ];

      }

      {
        name = "Professional";
        children = [
          {
            url = "https://linkedin.com";
            name = "Linkedin";
          }
          {
            url = "https://open-resume.com";
            name = "Open Resume";
          }
        ];

      }
    ];

    NoDefaultBookmarks = true;
  };

  ContentSettings = {
    AIControls = {
      Default = {
        Value = "blocked";
        Locked = true;
      };
    };

    PictureInPicture = {
      Default = true;
      Locked = true;
    };
    PopupBlocking = {
      Default = true;
      Locked = true;
    };
  };

  #TODO: just installations. No need to expose custom filters
  Extensions = {

  };

  #TODO:
  LocalDataStorage = {

  };

  Miscellaneous = {

    DisableAccounts = true;
    DisableFirefoxAccounts = true;
    DisableFirefoxStudies = true;
    DisableFirefoxScreenshots = true;
    DisableProfileRefresh = true;
    DisableTelemetry = true;
    GenerativeAI = {
      Enabled = false;
      Locked = true;
    };
  };

  #TODO: anything else?
  NetworkSecurity = {
    HttpAllowlist = map (item: item.url) homelabServices;

  };

  PasswordManager = {
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
    DisableMasterPasswordCreation = true;
    OfferToSaveLogins = false;
    PasswordManagerEnabled = false;

  };

  Search = {

    FirefoxSuggest = {
      WebSuggestions = false;
      SponsoredSuggestions = false;
      OnlineEnable = false;
      Locked = true;
    };

    SearchEngines = {
      Add = [
        {
          Name = "No AI DuckDuckGo";
          URLTemplate = "https://noai.duckduckgo.com/?q={searchTerms}";
          Method = "GET";
        }
      ];

      Default = "No AI DuckDuckGo";

      Remove = [
        "Bing"
        "Google"
        "Perplexity"
        "eBay"
        "Wikipedia"
        "DuckDuckGo"
      ];

      PreventInstalls = true;

    };

  };

  #TODO: more stuff here
  Startup = {
    FirefoxHome = {
      Search = true;
      TopSites = false;
      SponsoredTopSites = false;
      Highlights = false;
      Pocket = false;
      Stories = false;
      SponsoredPocket = false;
      SponsoredStories = false;
      Snippets = false;
      Widgets = {
        Enabled = false;
      };
      Locked = true;
    };

  };

  # If you add a new category above, add it to this list so it can be merged into the final
  # policy attribute set
  policies = lib.mergeAttrsList [
    Bookmarks
    ContentSettings
    Extensions
    LocalDataStorage
    Miscellaneous
    NetworkSecurity
    PasswordManager
    Search
    Startup
  ];

in
{
  programs.firefox = {
    enable = true;
    inherit policies;

    profiles.default = {
      name = "Default";
      id = 0;
      isDefault = true;

    };
  };
}
