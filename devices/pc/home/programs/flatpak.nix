{ ... }:
{

  services.flatpak.enable = true;

  # nix-flatpak options are explained in plain English here:
  # https://github.com/gmodena/nix-flatpak
  #
  # Detailed options here:
  # https://github.com/gmodena/nix-flatpak/blob/main/modules/options.nix
  #
  # Note that nix-flakpak can do the same as flatseal
  #
  # Adding flathub to be explicit. Not adding it introduces some implicit behavior
  services.flatpak.remotes = [
    {
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }
  ];

  # Auto update using systemd timer
  # https://wiki.archlinux.org/title/Systemd/Timers
  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "daily";
  };

  # Setting to true, since flatpaks tend to install several dependencies
  services.flatpak.uninstallUnmanaged = true;

}
