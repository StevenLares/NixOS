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
  remoteHomelabServices = [
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.syncthing-forwarded_port}";
      name = "Syncthing (forward from server)";
    }
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.full-text-rss_port}";
      name = "Full Text RSS";
    }
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.rss-bridge_port}";
      name = "RSS-Bridge";
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
      url = "http://${central-server_ip}.local:${self-hosted-ports.fresh-rss_port}";
      name = "Fresh RSS";
    }
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.navidrome_port}";
      name = "Navidrome";
    }
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.linkding_port}";
      name = "Linkding";
    }
    {
      url = "http://${central-server_ip}.local:${self-hosted-ports.forgejo_port}";
      name = "Forgejo";
    }

  ];

  Bookmarks = {
    ManagedBookmarks = [
      { toplevel_name = "Nix Managed Bookmarks"; }
      {
        name = "Homelab";
        children = [
          {
            url = "localhost:${self-hosted-ports.syncthing-client_port}";
            name = "Syncthing (self)";
          }
        ]
        ++ remoteHomelabServices;
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

        #TODO: more bookmarks

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

  };

  #TODO:
  Extensions = {

  };

  #TODO:
  LocalDataStorage = {

  };

  Miscellaneous = {

    DisableAccounts = true;
    DisableFirefoxAccounts = true;
    DisableFirefoxStudies = true;
    DisableTelemetry = true;
    GenerativeAI = {
      Enabled = false;
      Locked = true;
    };

  };

  NetworkSecurity = {
    HttpAllowlist = map (item: item.url) remoteHomelabServices;

  };

  PasswordManager = {
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
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
    };

  };

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

    # This block only exists because I dislike the default profile name that gets auto-generated, which was once 'default-release-<some numbers>'
    profiles.default = {
      name = "Default";
      id = 0;
      isDefault = true;
    };
  };
}
