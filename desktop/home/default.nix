{ ... }:

{

  # TODO: Add linked dotfiles, although I currently don't know how to do that

  imports = [
    ./firefox.nix
    ./keepassxc.nix
  ];

  # Everything below is stuff that doesn't really need its own module. They are most appropriate for a 'default' module.

  # Note that there is only one user in this config, as that matches my usecase exactly.
  home.username = "steven";
  home.homeDirectory = "/home/steven";

  # Allows for creation of XDG autostart entries
  xdg.autostart.enable = true;

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
