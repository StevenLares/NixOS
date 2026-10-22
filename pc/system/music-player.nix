{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gelly
  ];

}
