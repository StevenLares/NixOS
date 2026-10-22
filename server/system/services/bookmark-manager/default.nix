{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    linkding
  ];
}
