{ pkgs, ... }:
{
  # Allows you to mount a remote path into a local path
  environment.systemPackages = with pkgs; [
    sshfs
  ];
}
