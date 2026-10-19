{ host, ... }: {

  # Be very careful with this logic.

  boot.loader =
    if host == "acer-e15-laptop" then
      {
        grub.enable = true;
        grub.device = "/dev/sda";
        grub.useOSProber = true;
        grub.configurationLimit = 10; # Limiting number of generations
      }
    else if host == "nuc-desktop" then
      {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        systemd-boot.configurationLimit = 10; # Limiting number of generations
      }
    else
      { };
}
