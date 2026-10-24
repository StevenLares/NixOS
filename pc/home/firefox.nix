{ ... }:

# TODO: Since I am migrating to policies (and away from profiles),
# this might be better suited to a nixpkgs installation

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
  # TODO: add links on newtab page
  # TODO: add home server exceptions to strict HTTPS
  # TODO: add timeframe for browsing history
  commonFirefoxSettings = {
    "accessibility.typeaheadfind.flashBar" = 0;
    "browser.nova.enabled" = false;
    "browser.search.region" = "US";
    "browser.tabs.groups.enabled" = false;
    "browser.tabs.groups.smart.enabled" = false;
    "browser.tabs.groups.smart.userEnabled" = false;
    "browser.toolbars.bookmarks.visibility" = "never";
    "dom.security.https_only_mode" = true;
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

    # TODO: bookmarks
    # TODO: extensions

    # TODO: HTTPS configs
    # TODO:
    # SanitizeOnShutdown = {
    #
    # };

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
    policies = commonPolicies;
    profiles.default = {
      name = "Default";
      id = 0;
      isDefault = true;
      settings = commonFirefoxSettings;
      search = commonSearchSettings;
    };
  };
}
