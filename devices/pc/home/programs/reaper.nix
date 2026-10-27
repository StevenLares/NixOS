{ pkgs, ... }: {

  # Reaper needs all of this to be useful
  # I don't want to undercut it though;
  # Reaper is a highly customizable timeline DAW
  # Not free, so go to the website to download license file and add it to program
  home.packages = with pkgs; [
    reaper
    reaper-reapack-extension
    reaper-sws-extension
  ];

  home.file.".config/REAPER/UserPlugins/reaper_reapack-x86_64.so".source =
    "${pkgs.reaper-reapack-extension}/UserPlugins/reaper_reapack-x86_64.so";

  #TODO: Add SWS

}
