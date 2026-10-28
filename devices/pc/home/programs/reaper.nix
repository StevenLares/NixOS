{ pkgs, ... }: {

  # Reaper needs all of this to be useful
  # I don't want to undercut it though;
  # Reaper is a highly customizable timeline DAW
  # Not free, so go to the website to download license file and add it to program
  home.packages = with pkgs; [
    reaper
    reaper-reapack-extension
    reaper-sws-extension
    #TODO: Testing something
    renoise

  ];

  home.file.".config/REAPER/UserPlugins/reaper_reapack-x86_64.so".source =
    "${pkgs.reaper-reapack-extension}/UserPlugins/reaper_reapack-x86_64.so";

  # Had to run this command to find it:
  # find "$(nix eval --raw nixpkgs#reaper-sws-extension.outPath)" -type f

  home.file.".config/REAPER/UserPlugins/reaper_sws-x86_64.so".source =
    "${pkgs.reaper-sws-extension}/UserPlugins/reaper_sws-x86_64.so";

  #TODO: add other plugins
}
