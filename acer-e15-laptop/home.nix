{ config, pkgs, ... }:

{

  home.username = "steven";
  home.homeDirectory = "/home/steven";

  # Packages that should be installed to the user profile.
  # home.packages = with pkgs; [
  # ];

  # Allows for creation of XDG autostart entries
  xdg.autostart.enable = true;

  # TODO: Need to add the rest of the settings
  # Maybe extract out common settings
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

  # TODO: Will add more home-manager configs
  # See this for inspiration:
  # https://wiki.nixos.org/wiki/Obsidian
  # https://home-manager-options.extranix.com/?query=obsidian&release=release-26.05
  programs.obsidian = {
    enable = true;

  };

  # TODO: Will add more home-manager configs
  # See this for inspiration:
  # https://home-manager-options.extranix.com/?query=lutris&release=release-26.05
  # Seems like there are known issues, although this seems to be the system version:
  # https://wiki.nixos.org/wiki/Lutris
  programs.lutris = {
    enable = true;

  };

  #TODO: minimize on open
  #TODO: tray icon
  #TODO: colorful tray icon
  #TODO: minimize instead of closing
  programs.keepassxc = {
    enable = true;
    autostart = true;

  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";

}
