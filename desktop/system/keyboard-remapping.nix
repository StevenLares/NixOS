{ config, ... }:
let
  corsair_k70_mk2_kbd = rec {
    device = "/dev/input/by-id/usb-Corsair_CORSAIR_K70_RGB_MK.2_Mechanical_Gaming_Keyboard_1602F012AF8A0D24603DA663F5001BC3-event-kbd";
    config = ''

      (defcfg
        input  (device-file "${device}" )
        output (uinput-sink "corsair_k70_mk2_kbd_KMonad")
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

  acer-e15-laptop_built-in_kbd = rec {
    device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
    config = ''
        
      (defcfg
        input  (device-file "${device}" )
        output (uinput-sink "acer-e15-laptop_built-in_kbd_KMonad")
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

in
{

  services.kmonad.enable = true;

  services.kmonad.keyboards =
    if config.networking.hostName == "nuc-desktop" then
      { inherit corsair_k70_mk2_kbd; }
    else if config.networking.hostName == "acer-e15-laptop" then
      {
        inherit corsair_k70_mk2_kbd; # just in case that gets plugged in
        inherit acer-e15-laptop_built-in_kbd;
      }
    else
      { };

}
