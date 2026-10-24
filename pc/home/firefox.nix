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
    # "app.shield.optoutstudies.enabled" = false;
    "browser.nova.enabled" = false;
    "browser.bookmarks.restore_default_bookmarks" = false;
    "browser.bookmarks.showMobileBookmarks" = false;
    "browser.download.deletePrivate.chosen" = true;
    "browser.preferences.config_warning.warningPasswordManager.dismissed" = true;
    # "browser.preonboarding.splashShown" = true;
    # "browser.promo.syncPromo.history.connectdevice.dismissed" = true;
    # "browser.rights.3.shown" = true;
    "browser.search.region" = "US";
    # "browser.search.suggest.enabled" = false;
    # "browser.shell.checkDefaultBrowser" = false;
    "browser.tabs.groups.enabled" = false;
    "browser.tabs.groups.smart.enabled" = false;
    "browser.tabs.groups.smart.userEnabled" = false;
    # "browser.toolbarbuttons.introduced.sidebar-button" = true;
    "browser.toolbars.bookmarks.visibility" = "never";
    # "browser.translations.enable" = false;
    # "browser.translations.mostRecentTargetLanguages" = "en";
    # "browser.translations.panelShown" = true;
    # "browser.urlbar.showSearchSuggestionsFirst" = false;
    # "datareporting.healthreport.uploadEnabled" = false;
    # "datareporting.usage.uploadEnabled" = false;
    "dom.security.https_only_mode" = true;
    # "extensions.activeThemeID" = "default-theme@mozilla.org";
    # "extensions.formautofill.addresses.enabled" = false;
    # "extensions.formautofill.creditCards.enabled" = false;
    # "extensions.ml.enabled" = false;
    # "extensions.ui.dictionary.hidden" = true;
    # "extensions.ui.extension.hidden" = false;
    # "extensions.ui.locale.hidden" = true;
    # "extensions.ui.mlmodel.hidden" = true;
    # "extensions.ui.plugin.hidden" = false;
    # "extensions.ui.sitepermission.hidden" = true;
    # "extensions.ui.theme.hidden" = false;
    # "extensions.unifiedExtensions.button.always_visible" = false;
    # "media.videocontrols.picture-in-picture.enable-when-switching-tabs.enabled" = false; # keep false, annoying otherwise
    # "sidebar.visibility" = "hide-on-close";
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
