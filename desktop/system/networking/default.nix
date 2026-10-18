{ ... }: {
  imports = [
    ./avahi.nix
    ./essential-packages.nix
    ./network-manager.nix
    ./ssh.nix
    ./vpn.nix
  ];
}
