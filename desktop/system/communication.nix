{ ... }:
{

  services.flatpak.packages = [

    # Not really something I care to pin in Nix
    # I also want stable updates as quickly as possible
    {
      appId = "org.signal.Signal";
      origin = "flathub";
    }

    # There's seemingly issues in Nixpkgs version.
    # Not really something I care to pin in Nix
    # I also want stable updates as quickly as possible
    {
      appId = "com.discordapp.Discord";
      origin = "flathub";
    }
  ];

}
