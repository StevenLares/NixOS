{ config, syncthing-paths, ... }:
{
  #TODO: Actually add the linking function

  # /home/steven/.config/PCSX2/bios -> /home/steven/Synced/Save Game Data/emulator saves/PCSX2/bios
  # /home/steven/.config/PCSX2/gamesettings -> /home/steven/Synced/Save Game Data/emulator saves/PCSX2/gamesettings
  # /home/steven/.config/PCSX2/inputprofiles -> /home/steven/Synced/Save Game Data/emulator saves/PCSX2/inputprofiles
  # /home/steven/.config/PCSX2/memcards -> /home/steven/Synced/Save Game Data/emulator saves/PCSX2/memcards
  # /home/steven/.config/PCSX2/snaps -> /home/steven/Synced/Save Game Data/emulator saves/PCSX2/snaps

  # /home/steven/.config/retroarch/saves -> /home/steven/Synced/Save Game Data/emulator saves/retroarch/saves

  # /home/steven/.config/ppsspp/PSP/SAVEDATA -> /home/steven/Synced/Save Game Data/emulator saves/PSP/SAVEDATA

  # /home/steven/.local/share/dolphin-emu/GBA -> /home/steven/Synced/Save Game Data/emulator saves/dolphin-emu/GBA
  # /home/steven/.local/share/dolphin-emu/GC -> /home/steven/Synced/Save Game Data/emulator saves/dolphin-emu/GC
  # /home/steven/.local/share/dolphin-emu/Wii -> /home/steven/Synced/Save Game Data/emulator saves/dolphin-emu/Wii

}
