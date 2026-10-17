{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    flatpak
  ];

  #TODO: After you add nix-flatpak, add:
  #TODO: flathub remote
  #TODO: flatseal
  #TODO: sensible flatpak settings
}
