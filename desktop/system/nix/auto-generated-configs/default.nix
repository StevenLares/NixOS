{ host, ... }: {

  imports =
    if host == "acer-e15-laptop" then
      [ ./acer-e15-laptop ]
    else if host == "nuc-desktop" then
      [ ./nuc-desktop ]
    else
      [ ];
}
