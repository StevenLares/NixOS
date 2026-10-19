{ host, ... }: {

  imports =
    if host == "acer-e15-laptop" then
      [ ./acer-e15-laptop.nix ]
    else if host == "nuc-desktop" then
      [ ./nuc-desktop.nix ]
    else
      [ ];
}
