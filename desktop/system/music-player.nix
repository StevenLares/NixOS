{ ... }:
{
  # TODO: Replace this with something native
  # Preferably something other than Feishen
  services.flatpak.packages = [
    {
      appId = "org.jeffvli.feishin";
      origin = "flathub";
    }
  ];
}
