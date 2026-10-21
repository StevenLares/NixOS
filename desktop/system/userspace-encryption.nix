{ pkgs, ... }: {

  # Tools for user-side encryption.
  # These tools allow you to decrypt files and then mount that data in a temporary directory, allowing you to work on them with different programs.

  environment.systemPackages = with pkgs; [
    cryfs
    gocryptfs
  ];

}
