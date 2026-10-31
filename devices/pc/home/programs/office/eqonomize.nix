{ ... }: {

  # Double-entry accounting app. Not packaged on nixpkgs... yet
  services.flatpak.packages = [
    {
      appId = "io.github.eqonomize.eqonomize";
      origin = "flathub";
    }
  ];

}
