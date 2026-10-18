{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    libreoffice-qt

    hunspell
    hunspellDicts.en-us
    hyphenDicts.en_US
  ];

  # Double-entry accounting app
  services.flatpak.packages = [
    {
      appId = "io.github.eqonomize.eqonomize";
      origin = "flathub";
    }
  ];

}
