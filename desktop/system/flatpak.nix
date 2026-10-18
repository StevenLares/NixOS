{ ... }:
{
  # environment.systemPackages = with pkgs; [
  #   flatpak
  # ];

  services.flatpak.enable = true;

  # nix-flatpak options are explained in plain English here:
  # https://github.com/gmodena/nix-flatpak
  # Detailed options here:
  # https://github.com/gmodena/nix-flatpak/blob/main/modules/options.nix

  # Adding flathub just to be explicit
  services.flatpak.remotes = [
    {
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }
  ];

  # Auto update
  services.flatpak.update.auto = {
    enable = true;
    # uses systemd timer
    # https://wiki.archlinux.org/title/Systemd/Timers
    onCalendar = "daily";
  };

  # Setting to true, since flatpaks tend to install several dependencies
  services.flatpak.uninstallUnmanaged = true;

}
