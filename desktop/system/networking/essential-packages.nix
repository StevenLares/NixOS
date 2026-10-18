{ pkgs, ... }: {

  # Network stuff that practically every Linux PC should have
  environment.systemPackages = with pkgs; [
    wget

  ];
}
