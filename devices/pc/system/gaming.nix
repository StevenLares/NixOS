{ ... }:
{

  # Microcompositor for gaming.
  # Can force resolution and frame-rate, add Alt-tab support for games that don't support it, and much more.
  # It is essential for Linux gaming (although less-so on Wayland)
  programs.gamescope.enable = true;

  # Temporarily request game optimizations for your gaming session
  programs.gamemode.enable = true;

  #TODO: Might move to home-manager, somehow
  # Games should probably be sandboxed (I play a lot of random indies).
  # Games also litter $HOME, this reigns that in
  # I also don't care to pin this
  # I want the latest version of Steam at all times
  services.flatpak.packages = [
    {
      appId = "com.valvesoftware.Steam";
      origin = "flathub";
    }
  ];

}
