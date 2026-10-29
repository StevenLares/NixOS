{ ... }: {

  imports = [
    # These tools allows you to decrypt files and then mount that data in a temporary directory, allowing you to work on them with different programs.
    ./cryfs.nix
    ./gocryptfs.nix

    ./sshfs.nix
  ];

}
