{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    wob
  ];
}
