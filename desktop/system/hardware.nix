{ ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  # Disable PS4 and PS5 touchpads
  services.udev.extraRules = ''
    # USB Connection for PS4
    ATTRS{name}=="Sony Interactive Entertainment Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"

    # USB Connection for PS5
    ATTRS{name}=="Sony Interactive Entertainment DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"

    # Bluetooth Connection (works with both)
    ATTRS{name}=="Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';

}
