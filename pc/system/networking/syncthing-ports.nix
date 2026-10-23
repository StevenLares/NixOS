{ ... }: {

  # For now, this is enough for a local connection
  networking.firewall.allowedTCPPorts = [ 22000 ];
}
