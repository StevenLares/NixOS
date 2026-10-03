{ ... }:
# TODO: Need to add the rest of the settings
# TODO: Maybe extract out common settings
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "Default";
      id = 0;
      isDefault = true;
      settings = {
        "accessibility.typeaheadfind.flashBar" = 0;
        "app.shield.optoutstudies.enabled" = false;
        "browser.ai.control.default" = "blocked";
        "browser.ai.control.linkPreviewKeyPoints" = "blocked";
        "browser.ai.control.pdfjsAltText" = "blocked";
        "browser.ai.control.sidebarChatbot" = "blocked";
        "browser.ai.control.smartTabGroups" = "blocked";
        "browser.ai.control.translations" = "blocked";
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.bookmarks.showMobileBookmarks" = false;
        "browser.download.deletePrivate.chosen" = true;
        "browser.ml.chat.enabled" = false;
        "browser.ml.chat.menu" = false;
        "browser.ml.chat.page" = false;
        "browser.ml.linkPreview.collapsed" = true;
        "browser.ml.linkPreview.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.newtabWallpapers.user.enabled" = true;
        "browser.newtabpage.activity-stream.newtabWallpapers.user.enabled.migrated" = true;
        "browser.newtabpage.activity-stream.newtabWallpapers.wallpaper" = "dark-color";
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.showWeather" = false;
        "browser.newtabpage.activity-stream.topSitesRows" = 3;
        "browser.newtabpage.activity-stream.widgets.weather.enabled" = false;
        "browser.preferences.config_warning.warningPasswordManager.dismissed" = true;
        "browser.promo.syncPromo.history.connectdevice.dismissed" = true;
        "browser.rights.3.shown" = true;
        "browser.search.region" = "US";
        "browser.search.serpEventTelemetryCategorization.regionEnabled" = false;
        "browser.search.suggest.enabled" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.tabs.groups.enabled" = false;
        "browser.tabs.groups.smart.enabled" = false;
        "browser.tabs.groups.smart.userEnabled" = false;
        "browser.toolbarbuttons.introduced.sidebar-button" = true;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.translations.enable" = false;
        "browser.translations.mostRecentTargetLanguages" = "en";
        "browser.translations.panelShown" = true;
        "browser.urlbar.showSearchSuggestionsFirst" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.quickactions" = false;
        "browser.urlbar.suggest.quicksuggest.all" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.recentsearches" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.trending" = false;
        "datareporting.usage.uploadEnabled" = false;
        "dom.security.https_only_mode" = true;
        "extensions.activeThemeID" = "default-theme@mozilla.org";
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "extensions.ml.enabled" = false;
        "extensions.pictureinpicture.enable_picture_in_picture_overrides" = true;
        "extensions.ui.dictionary.hidden" = true;
        "extensions.ui.extension.hidden" = false;
        "extensions.ui.locale.hidden" = true;
        "extensions.ui.mlmodel.hidden" = true;
        "extensions.ui.plugin.hidden" = false;
        "extensions.ui.sitepermission.hidden" = true;
        "extensions.ui.theme.hidden" = false;
        "extensions.unifiedExtensions.button.always_visible" = false;
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
}
