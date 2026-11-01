{ ... }: {
  imports = [
    ./firewall-rules

    ./mDNS.nix
    ./network-manager.nix
    ./remote-access.nix
    ./ssh.nix

  ];
}
