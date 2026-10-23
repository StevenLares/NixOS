{ ... }:
{

  # This folder is about nix configuration... so stuff that's not directly related to my system setup (but still important!)
  imports = [
    ./auto-generated-configs

    ./critical-packages.nix
    ./experimental-features.nix
    ./fhs.nix
    ./garbage-collection.nix
    ./unfree.nix
  ];
}
