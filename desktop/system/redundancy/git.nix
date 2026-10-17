{ pkgs, ... }: {

  # Why is git here? I guess git can be used as a backup system
  environment.systemPackages = with pkgs; [
    git

  ];
}
