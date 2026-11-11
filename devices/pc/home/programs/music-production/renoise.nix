{ pkgs, ... }:
{
  #TODO: After adding licensed copy, update the Readme on instructions
  home.packages = with pkgs; [
    renoise
  ];
}
