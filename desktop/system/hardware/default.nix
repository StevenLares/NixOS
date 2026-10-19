{ ... }:
{
  imports = [
    ./auto-generated-configs

    ./udev.nix
    ./bluetooth.nix
    ./keyboard-remapping.nix
  ];
}
