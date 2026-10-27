{ ... }: {

  # like in pc/, depends on if statements to create exceptions
  imports = [
    # All VM's have the same "hardware", so just re-use them!
    ./auto-generated

    ./restic.nix
    ./ssh.nix
    ./tailscale.nix
  ];
}
