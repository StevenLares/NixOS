{ pkgs, ... }:
{
  home.packages = with pkgs; [

    libreoffice-qt

    hunspell
    hunspellDicts.en-us
    hyphenDicts.en_US
  ];

}
