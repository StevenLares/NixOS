{ pkgs, ... }:
{
  home.packages = with pkgs; [
    renoise
  ];
}
