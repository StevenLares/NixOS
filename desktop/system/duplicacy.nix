{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    duplicacy
  ];
}
