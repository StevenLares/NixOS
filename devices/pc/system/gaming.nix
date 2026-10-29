{ pkgs, ... }:

#TODO: Will move some stuff to home manager
{

  # Microcompositor for gaming.
  # Can force resolution and frame-rate, add Alt-tab support for games that don't support it, and much more.
  # It is essential for Linux gaming (although less-so on Wayland)
  programs.gamescope.enable = true;

  # Temporarily request game optimizations for your gaming session
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [

    # Frame-rate and other info. Useful for games outside of Steam
    mangohud

    # Download and manage various Proton-GE builds.
    # Proton-GE are just extensions to the regular Proton builds Valve releases.
    # Usually those are just license-incompatible features, like a video codec.
    protonup-qt

    # Winetricks, but for specific steam games
    # This allows you to install mods written for Windows games
    protontricks

    # Was originally going to declare cores here, but decided that's overkill
    # Instead, this downloads Retroarch (without cores), and you are intended to download them within the program.
    retroarch

    # PS2 emulator
    pcsx2

    # Gamecube + Wii emulator
    dolphin-emu

  ];

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

  #TODO: maybe lutris as flatpak? and have it setup so it doesn't download anything, just use the configs here?
  # That keeps windows and linux games organized in a .var folder
  # and allows games to be organized from one launcher, as usual

}
