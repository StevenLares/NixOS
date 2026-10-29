{ pkgs, ... }:
{
  # Allows you to mount a remote path into a local path
  home.packages = with pkgs; [
    sshfs
  ];
}
