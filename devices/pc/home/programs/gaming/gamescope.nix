{ ... }: {

  # Microcompositor for gaming.
  # Can force resolution and frame-rate, add Alt-tab support for games that don't support it, and much more.
  # It is essential for Linux gaming (although less-so on Wayland)

  # Needs to be flatpak, native version doesn't work with flatpak steam
  # Also, set up as user flatpak to be consistent with the rest of my installation
  services.flatpak.packages = [
    {
      appId = "org.freedesktop.Platform.VulkanLayer.gamescope/x86_64/26.08";
      origin = "flathub";
    }
  ];
}
