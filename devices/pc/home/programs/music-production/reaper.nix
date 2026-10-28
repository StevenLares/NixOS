{ pkgs, ... }: {

  home.packages = with pkgs; [

    # Reaper needs all of this to be useful
    # I don't want to undercut it though;
    # Reaper is a highly customizable timeline DAW
    # Not free, so go to the website to download license file and add it to program
    reaper
    reaper-reapack-extension
    reaper-sws-extension
  ];

  # The below adds Reapack and SWS extensions to Reaper

  # Found it on Reddit
  home.file.".config/REAPER/UserPlugins/reaper_reapack-x86_64.so".source =
    "${pkgs.reaper-reapack-extension}/UserPlugins/reaper_reapack-x86_64.so";

  # Had to run this command to find it. I expect other plugins to behave the same way:
  # find "$(nix eval --raw nixpkgs#reaper-sws-extension.outPath)" -type f

  home.file.".config/REAPER/UserPlugins/reaper_sws-x86_64.so".source =
    "${pkgs.reaper-sws-extension}/UserPlugins/reaper_sws-x86_64.so";

}
