{ lib, ... }:

# TODO: If I do profiles, then add desktop-entries for other profiles, including private browsing for default
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
  commonPolicies = {
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

    # TODO: HTTPS configs, with exceptions to homelab

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
  defaultPolicies = {
    # TODO: bookmarks
    # TODO: extensions
    # TODO: theme
    #TODO: SanitizeOnShutdown = {}

  };

  youtubePolicies = {
    # TODO: homepage
    # TODO: bookmarks
    # TODO: extensions
    # TODO: theme
    #TODO: SanitizeOnShutdown = {}

  };

  twitchPolicies = {
    # TODO: homepage
    # TODO: bookmarks
    # TODO: extensions
    # TODO: theme
    #TODO: SanitizeOnShutdown = {}
  };
in
{
  programs.firefox = {
    enable = true;
    policies = lib.mergeAttrs commonPolicies defaultPolicies;
    profiles.default = {
      name = "Default";
      id = 0;
      isDefault = true;
      search = commonSearchSettings;
    };
  };
}
