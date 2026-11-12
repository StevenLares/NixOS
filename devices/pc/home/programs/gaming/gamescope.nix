{ ... }: {

  # Microcompositor for gaming.
  # Can force resolution and frame-rate, add Alt-tab support for games that don't support it, and much more.
  # It is essential for Linux gaming (although less-so on Wayland)

  # This is for flatpak games, including flatpak steam
  # Set up as a user flatpak since I don't want system flatpaks
  services.flatpak.packages = [
    {
      appId = "org.freedesktop.Platform.VulkanLayer.gamescope/x86_64/26.08";
      origin = "flathub";
    }
  ];
}
