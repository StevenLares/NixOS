{ pkgs, ... }: {

  # This one does not produce files of equal size, which is less good for obfuscation but great for backing up and syncing across devices.
  home.packages = with pkgs; [
    gocryptfs
  ];

}
