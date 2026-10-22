{ ... }: {

  # like in desktops, depends on if statements to create exceptions
  imports = [
    ./restic.nix
    ./ssh.nix
    ./tailscale.nix
  ];
}
