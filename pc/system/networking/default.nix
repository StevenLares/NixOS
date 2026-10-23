{ ... }: {
  imports = [
    ./avahi.nix
    ./network-manager.nix
    ./ssh.nix
    ./syncthing-ports.nix
    ./vpn.nix
  ];
}
