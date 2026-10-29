{ pkgs, ... }: {

  # This one produces files of equal size, which means the encrypted folders get quite bloated with file entries.
  # Good for obfuscation, though.
  home.packages = with pkgs; [
    cryfs
  ];

}
