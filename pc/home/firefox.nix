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
            url = "https://mozilla.org";
            name = "Mozilla.org";
          }
          {
            url = "https://support.mozilla.org/";
            name = "SUMO";
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
