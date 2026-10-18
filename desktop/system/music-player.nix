{ ... }:
{
  # TODO: Replace this with something native
  # Preferably something other than Feishen
  # ampcast: https://github.com/rekkyrosso/ampcast
  # SubTUI: https://github.com/MattiaPun/SubTUI
  # aonsoku: https://github.com/victoralvesf/aonsoku
  # Nocturne: https://github.com/Jeffser/Nocturne
  # gelly: https://github.com/Fingel/gelly
  # ratune: https://github.com/acmagn/ratune
  services.flatpak.packages = [
    {
      appId = "org.jeffvli.feishin";
      origin = "flathub";
    }
  ];
}
