{ pkgs, ... }:

# I added this package, since the home-manager service does not provide the cli package.
# Note that while most (or all) of my flatpaks are user installs, I decided to make this package install system-wide.
# Why? Flatpaks are essentially another package manager; I think that qualifies it as a system-level concern.
{
  environment.systemPackages = with pkgs; [
    flatpak
  ];
}
