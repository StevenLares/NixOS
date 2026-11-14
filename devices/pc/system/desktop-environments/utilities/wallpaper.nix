{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    awww
    waypaper
  ];
}
