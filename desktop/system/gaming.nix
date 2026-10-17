{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [

    # Microcompositor for gaming.
    # Can force resolution, frame-rate, add Alt-tab support for games that don't support it,
    # and much more. It is essential (although less-so on Wayland)
    gamescope

    # Frame-rate and other info. Useful for games outside of Steam
    mangohud

    # Temporarily request game optimizations for your gaming session
    gamemode

    # Download and manage various Proton-GE builds.
    # Proton-GE are just extensions to the regular Proton builds Valve releases.
    # Usually those are just license-incompatible features, like a video codec.
    protonup-qt

    # Winetricks, but for specific steam games
    protontricks
  ];
  #TODO: Steam, Bottles, emulators. Probably through Flatpak to keep them quickly updated and sandboxed
}
