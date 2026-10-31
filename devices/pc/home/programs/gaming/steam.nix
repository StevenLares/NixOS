{ ... }: {

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
