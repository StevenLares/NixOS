{ pkgs, ... }:
{
  #TODO: Will eventually replace this with restic, but not today
  environment.systemPackages = with pkgs; [
    duplicacy
  ];
}
