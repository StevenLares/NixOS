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

    #TODO: this seems to be how to set this up with specific cores
    # (retroarch.override {
    #   cores = with libretro; [
    #     snes9x
    #     beetle-psx
    # ];
    # })

    # PS2 emulator
    pcsx2

    # Gamecube + Wii emulator
    dolphin-emu

  ];

  #TODO: Steam, Bottles, maybe Lutris?. Probably through Flatpak to keep them quickly updated and sandboxed
}
