{ pkgs, ... }: {

  # Another tool that allows you to decrypt files and then mount that data in a temporary directory, allowing you to work on them with different programs.
  # This one does not produce files of equal size, which is less good for obfuscation but great for backing up and syncing across devices.

  home.packages = with pkgs; [
    gocryptfs
  ];

}
