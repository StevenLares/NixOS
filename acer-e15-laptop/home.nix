{ config, pkgs, ... }:

{

  home.username = "steven";
  home.homeDirectory = "/home/steven";

  # Packages that should be installed to the user profile.
  # home.packages = with pkgs; [
  # ];

  defaultProfile = {
    name = "Default";
    id = 0;
    isDefault = true;
  };

  programs.firefox = {
    enable = true;
    profiles = defaultProfile;
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
