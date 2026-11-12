{ pkgs, ... }: {

  # Microcompositor for gaming.
  # Can force resolution and frame-rate, add Alt-tab support for games that don't support it, and much more.
  # It is essential for Linux gaming (although less-so on Wayland)

  # This is for non-flatpak games
  programs.gamescope.enable = true;

  # This makes the command available system-wide. Can use this to launch non-flatpak games
  environment.systemPackages = with pkgs; [
    gamescope
  ];
}
