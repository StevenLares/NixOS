{ pkgs, ... }:
{
  # TODO: my vision for this is automated provisioning
  # along with automated backups
  environment.systemPackages = with pkgs; [
    restic
  ];
}
