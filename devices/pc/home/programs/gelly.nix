{ pkgs, ... }: {
  # Minimialistic GTK music player, compatible with Navidrome
  home.packages = with pkgs; [
    gelly
  ];
}
