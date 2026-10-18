{ ... }: {
  imports = [
    ./additional-firewall-rules.nix
    ./avahi.nix
    ./network-manager.nix
    ./ssh.nix
    ./vpn.nix
  ];
}
