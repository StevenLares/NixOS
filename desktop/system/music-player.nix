{ ... }:
{
  # TODO: Replace this with something native
  # allowing for injectable navidrome server value
  services.flatpak.packages = [
    {
      appId = "org.jeffvli.feishin";
      origin = "flathub";
    }
  ];
}
