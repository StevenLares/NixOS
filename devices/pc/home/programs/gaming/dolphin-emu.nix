{ pkgs, ... }: {

  # Gamecube + Wii emulator
  home.packages = with pkgs; [
    dolphin-emu
  ];
}
