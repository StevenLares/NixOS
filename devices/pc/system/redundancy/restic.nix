{ pkgs, ... }:
{
  # TODO: my vision for this is automated provisioning
  # along with automated backups
  # TODO: swap with home-manager version
  environment.systemPackages = with pkgs; [
    restic
  ];
}
