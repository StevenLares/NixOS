{ config, ... }:
let

  # Unfortunately, you have to use the absolute path. Anchoring a relative path does not work.
  # If the dotfilesPath directory is adjusted, then this will fail (and the symlinks will not point to anything)
  dotfilesPath = "${config.home.homeDirectory}/NixOS/pc/home/dotfiles";
  nvimPath = "${dotfilesPath}/nvim/";
in
{
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimPath;
}
