{ ... }: {

  # like in pc/, depends on if statements to create exceptions
  imports = [
    ./restic.nix
    ./ssh.nix
    ./tailscale.nix
  ];
}
