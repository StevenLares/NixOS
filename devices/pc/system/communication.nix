{ pkgs, ... }:
{

  # Flatpak version was bugging out, so switched to native
  environment.systemPackages = with pkgs; [
    signal-desktop
  ];

  services.flatpak.packages = [

    #TODO: Might move to home-manager, somehow
    # There's seemingly issues in Nixpkgs version.
    # Not really something I care to pin in Nix
    # I also want stable updates as quickly as possible
    {
      appId = "com.discordapp.Discord";
      origin = "flathub";
    }
  ];

}
