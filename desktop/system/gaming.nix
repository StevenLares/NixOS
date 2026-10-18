{ pkgs, ... }:

let
  steamIcon = ./icons/steam-icon-14871.png;
  steamDesktopEntry = pkgs.makeDesktopItem {
    name = "steam-flatpak";
    desktopName = "Steam";
    exec = "flatpak run com.valvesoftware.Steam";
    icon = "${steamIcon}";
    terminal = false;
    categories = [ "Game" ];
  };

in

{

  environment.systemPackages = with pkgs; [

    # Microcompositor for gaming.
    # Can force resolution and frame-rate, add Alt-tab support for games that don't support it, and much more.
    # It is essential for Linux gaming (although less-so on Wayland)
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
    # TODO: replace with flatpak version, this can't find flatpak version for some reason
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

    steamDesktopEntry

  ];

  services.flatpak.packages = [
    {
      appId = "com.valvesoftware.Steam";
      origin = "flathub";
    }
  ];

  #TODO: maybe lutris as flatpak? and have it setup so it doesn't download anything, just use the configs here?
  # That keeps windows and linux games organized in a .var folder
  # and allows games to be organized from one launcher, as usual

}
