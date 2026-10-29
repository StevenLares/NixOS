{ pkgs, ... }: {

  # PS2 emulator
  home.packages = with pkgs; [
    pcsx2
  ];
}
