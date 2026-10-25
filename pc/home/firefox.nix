{
  lib,
  central-server_ip,
  self-hosted-ports,
  ...
}:

# TODO: Maybe a flake that pulls in the Quantum style?

#TODO: when services get moved to separate VMs, modify this function to take a custom IP.
let
  mkHomelabBookmark = name: port: {
    url = "http://${central-server_ip}.local:${toString port}";
    inherit name;
  };

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
          (mkHomelabBookmark "Syncthing (forwarded from server)" self-hosted-ports.syncthing-forwarded_port)
          (mkHomelabBookmark "Full Text RSS" self-hosted-ports.full-text-rss_port)
          (mkHomelabBookmark "RSS-Bridge" self-hosted-ports.rss-bridge_port)
          (mkHomelabBookmark "Jellyfin" self-hosted-ports.jellyfin_port)
          (mkHomelabBookmark "Kavita" self-hosted-ports.kavita_port)
          (mkHomelabBookmark "Fresh RSS" self-hosted-ports.fresh-rss_port)
          (mkHomelabBookmark "Navidrome" self-hosted-ports.navidrome_port)
          (mkHomelabBookmark "Linkding" self-hosted-ports.linkding_port)
          (mkHomelabBookmark "Forgejo" self-hosted-ports.forgejo_port)
        ];
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

  #TODO:
  NetworkSecurity = {

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
