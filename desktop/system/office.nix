{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    libreoffice-qt

    hunspell
    hunspellDicts.en-us
    hyphenDicts.en_US
  ];

  # TODO: Add read/write permission for ~/Mount/
  # Double-entry accounting app
  services.flatpak.packages = [
    {
      appId = "io.github.eqonomize.eqonomize";
      origin = "flathub";
    }
  ];

}
