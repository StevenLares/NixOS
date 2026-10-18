{ ... }: {
  imports = [
    ./avahi.nix
    ./network-manager.nix
    ./ssh.nix
    ./vpn.nix
  ];
}
