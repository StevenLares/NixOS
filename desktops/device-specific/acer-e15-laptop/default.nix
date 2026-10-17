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
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "acer-e15-laptop"; # Define your hostname.


  # Limit the number of generations to keep
  boot.loader.grub.configurationLimit = 10;





  services.kmonad = {
    enable = true;
    keyboards = {
      acer-e15-laptop_kbd = {
        device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
        config = ''
            
          (defcfg
            input  (device-file "/dev/input/by-path/platform-i8042-serio-0-event-kbd" )
            output (uinput-sink "kmonad kbd")
            fallthrough true
            allow-cmd false
          )

          (defsrc
            esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12  ssrq pause del home pgup pgdn end power
            grv  1    2    3    4    5    6    7    8    9    0    -    =                 bspc   nlck kp/  kp*  kp-
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \                   kp7  kp8  kp9  kp+
            caps a    s    d    f    g    h    j    k    l    ;    '                      ret    kp4  kp5  kp6
            lsft z    x    c    v    b    n    m    ,    .    /    rsft                 up       kp1  kp2  kp3  kprt
            lctl fn lmet lalt      spc    ralt cmp  rctl                           left down rght   kp0  kp.
          )

          (deflayer base
            _  _   _   _   _   _   _   _   _   _   _  _  _  _ _ _ _ _ _ _ _
            _  _    _    _    _    _    _    _    _    _    _    -    _                 _   _ _  _  _
            @tab_navigation  _    _    _    _    _    _    _    _    _    _    _    _    _                   _  _  _  _
            esc _    _    _    _    _    _    _    _    _    _    _                      _    _  _  _
            _ _    _    _    _    _    _    _    _    _    _    _                 _       _  _  _  _
            _ _ _ _      _    _ _  cmp                           _ _ _   _  _
          )

          (deflayer navigation
            _  _   _   _   _   _   _   _   _   _   _  _  _  _ _ _ _ _ _ _ _
            _  _    _    _    _    _    _    _    _    _    _    -    _                 _   _ _  _  _
            _  _    _    _    _    _    _    _    _    _    _    _    _    _                   _  _  _  _
            _ _    _    _    _    _    left    down    up    rght    _    _                      _    _  _  _
            _ _    _    _    _    _    _    _    _    _    _    _                 _       _  _  _  _
            _ _ _ _      _    _ _  _                           _ _ _   _  _
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
