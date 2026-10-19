{ ... }: {
  imports = [
    ./additional-firewall-rules.nix
    ./avahi.nix
    ./hostname.nix
    ./network-manager.nix
    ./ssh.nix
    ./vpn.nix
  ];
}
