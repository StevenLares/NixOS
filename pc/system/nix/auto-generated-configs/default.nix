{ host, ... }: {

  # each sys config is just bootloader + list size of previous nix builds in bootloader + networking host name + default nix state + auto generated hardware config
  imports =
    if host == "acer-e15-laptop" then
      [ ./acer-e15-laptop ]
    else if host == "nuc-desktop" then
      [ ./nuc-desktop ]
    else
      [ ];
}
