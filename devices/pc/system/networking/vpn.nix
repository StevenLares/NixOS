{ ... }: {

  # Seemingly can't make this one in user space. Makes sense, since this type of VPN is more of a system concern.
  services.tailscale.enable = true;
}
