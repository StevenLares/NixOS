{ syncthing-folders, ... }:

let
  cryfs = syncthing-folders.cryfs;
  gocryptfs = syncthing-folders.gocryptfs;
in
{
  #TODO: encryption / decryption helper code. Maybe this could be moved to aliases?
}
