{ pkgs, ... }:
{
  # Nix seemingly relies on these

  environment.systemPackages = with pkgs; [
    git
    wget
    vim
  ];

}
