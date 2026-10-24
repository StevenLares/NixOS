{ config, syncthing-paths, ... }:

#TODO: See Recovery files for help

let
  createSymlink = linkPath: targetPath: {
    "${linkPath}".source = config.lib.file.mkOutOfStoreSymlink targetPath;
  };
in
{
  # home.file = createSymlink ".local/share/my-link" "${config.home.homeDirectory}/path/that/may/not/exist";
}
