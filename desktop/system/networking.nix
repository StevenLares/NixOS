{ pkgs, ... }:
{

  # Enable networking
  networking.networkmanager.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;

  };

  environment.systemPackages = with pkgs; [
    wget

  ];
}
