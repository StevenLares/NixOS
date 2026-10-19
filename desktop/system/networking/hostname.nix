{ host, ... }:
{

  # Looks redundant, because it is.
  # For some reason, you need to reset what the hostname is on each build.
  # Note that the host (the parameter) is grabbed from flake.nix at build time
  networking.hostName =
    if host == "acer-e15-laptop" then
      "acer-e15-laptop"
    else if host == "nuc-desktop" then
      "nuc-desktop"
    else
      "Unknown-host";
}
