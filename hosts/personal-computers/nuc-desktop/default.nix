# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nuc-desktop"; # Define your hostname.

  # Limit the number of generations to keep
  boot.loader.systemd-boot.configurationLimit = 10;

  services.kmonad = {
    enable = true;
    keyboards = {
      corsair_k70_mk2_kbd = {
        device = "/dev/input/by-id/usb-Corsair_CORSAIR_K70_RGB_MK.2_Mechanical_Gaming_Keyboard_1602F012AF8A0D24603DA663F5001BC3-event-kbd";
        config = ''

          (defcfg
            input  (device-file "/dev/input/by-id/usb-Corsair_CORSAIR_K70_RGB_MK.2_Mechanical_Gaming_Keyboard_1602F012AF8A0D24603DA663F5001BC3-event-kbd" )
            output (uinput-sink "kmonad kbd")
            fallthrough true
            allow-cmd false
          )

          (defsrc
            esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12        ssrq slck pause
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc  ins  home pgup  nlck kp/  kp*  kp-
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \     del  end  pgdn  kp7  kp8  kp9  kp+
            caps a    s    d    f    g    h    j    k    l    ;    '    ret                        kp4  kp5  kp6
            lsft z    x    c    v    b    n    m    ,    .    /    rsft                 up         kp1  kp2  kp3  kprt
            lctl lmet lalt           spc            ralt rmet cmp  rctl            left down rght  kp0  kp.
          )

          (deflayer base
            _    _    _    _    _    _    _    _    _    _    _    _    _          _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _     _    _    _     _    _    _    _
            @tab_navigation  _    _    _    _    _    _    _    _    _    _    _   _    _    _     _    _    _    _    _    _
            esc _    _    _    _    _    _    _    _    _    _    _    _                _  _  _
            _    _    _    _    _    _    _    _    _    _    _    _                    _          _    _    _    _
            _    _    _            _            _ cmp _  _                       _    _    _     _    _
          )

          (deflayer navigation
            _    _    _    _    _    _    _    _    _    _    _    _    _          _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _     _    _    _     _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _     _    _    _     _    _    _    _
            _    _    _    _    _    _    left    down    up    rght   _    _    _               _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _                    _          _    _    _    _
            _    _    _              _              _    _    _    _               _    _    _     _    _   
          )


          (defalias 
            tab_navigation (tap-hold-next-release 200 tab (layer-toggle navigation))
          )
        '';
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
