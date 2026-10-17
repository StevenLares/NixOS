{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    proton-vpn
  ];

  services.tailscale.enable = true;
}
