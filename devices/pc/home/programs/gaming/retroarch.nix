{ pkgs, ... }: {

  # Was originally going to declare cores here, but decided that's overkill
  # Instead, this downloads Retroarch (without cores), and you are intended to download them within the program.
  home.packages = with pkgs; [
    retroarch
  ];
}
