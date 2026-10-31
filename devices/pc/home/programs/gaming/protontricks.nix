{ pkgs, ... }: {

  # Winetricks, but for specific steam games
  # This allows you to install mods written for Windows games
  #TODO: This *feels* like it should be a system concern, but not sure
  home.packages = with pkgs; [
    protontricks
  ];
}
