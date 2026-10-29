{ syncthing-paths, ... }:

let
  cryfs = syncthing-paths.cryfs;
  gocryptfs = syncthing-paths.gocryptfs;
in
{
  #TODO: encryption / decryption helper code. Maybe this could be moved to aliases?
}
