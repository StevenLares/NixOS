{ pkgs, ... }:
{

  # TODO: Will be removed in the future, and replaced with Restic
  # so no need to manage with home-manager later
  home.packages = with pkgs; [
    duplicacy
  ];
}
