{ central-server_ip, self-hosted-ports, ... }:

# TODO: Maybe a flake that pulls in the Quantum style?

let
  commonSearchSettings = {
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
  policies = {
    AIControls = {
      Default = {
        Value = "blocked";
        Locked = true;
      };
    };
    GenerativeAI = {
      Enabled = false;
      Locked = true;
    };
    DisableTelemetry = true;
    DisableFirefoxStudies = true;
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
    DisableAccounts = true;
    DisableFirefoxAccounts = true;
    NoDefaultBookmarks = true;
    OfferToSaveLogins = false;
    PasswordManagerEnabled = false;
    ManagedBookmarks = [
      { toplevel_name = "Nix Managed Bookmarks"; }
      {
        name = "Homelab";
        children = [
          {
            url = "http://${central-server_ip}.local:${self-hosted-ports.syncthing-client_port}";
            name = "Syncthing (self)";
          }
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
    ];

    # TODO: HTTPS configs, with exceptions to homelab
    # TODO: bookmarks
    # TODO: extensions
    # TODO: theme
    #TODO: SanitizeOnShutdown = {}

    #TODO:
    # SearchEngines = { };
    FirefoxSuggest = {
      WebSuggestions = false;
      SponsoredSuggestions = false;
      OnlineEnable = false;
      Locked = true;
    };
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

in
{
  programs.firefox = {
    enable = true;
    inherit policies;
    profiles.default = {
      name = "Default";
      id = 0;
      isDefault = true;
      search = commonSearchSettings; # TODO: will remove in favor of policy
    };
  };
}
