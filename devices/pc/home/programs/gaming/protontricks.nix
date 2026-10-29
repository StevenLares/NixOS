{ pkgs, ... }: {

  # Winetricks, but for specific steam games
  # This allows you to install mods written for Windows games
  home.packages = with pkgs; [
    protontricks
  ];
}
