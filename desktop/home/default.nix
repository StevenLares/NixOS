{ ... }:

{
  # Note that there is only one user in this config, as that matches my usecase exactly.
  home.username = "steven";
  home.homeDirectory = "/home/steven";

  # Packages that should be installed to the user profile.
  # home.packages = with pkgs; [
  # ];

  # Allows for creation of XDG autostart entries
  xdg.autostart.enable = true;

  imports = [ ./firefox.nix ];

  #TODO: minimize on open
  #TODO: tray icon
  #TODO: colorful tray icon
  #TODO: minimize instead of closing
  programs.keepassxc = {
    enable = true;
    autostart = true;

  };
  # TODO: add desktop entries

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
