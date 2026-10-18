{ ... }:
{

  services.flatpak.packages = [

    # Not really something I care to pin in Nix
    {
      appId = "org.signal.Signal";
      origin = "flathub";
    }

    # There's seemingly issues in Nixpkgs version.
    # I also don't care about pinning, since this is all stuff on their servers, anyways
    {
      appId = "com.discordapp.Discord";
      origin = "flathub";
    }
  ];

}
