{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    kavita
  ];
}
