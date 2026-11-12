# Some programs have their own config dotfiles and a configuration language.
# And sometimes, that's enough; they don't really need to be configured through home-manager or the Nix language.
# These dotfiles are included here to be linked by home-manager.
# This ensures that everything is in one Git repo.

{ config, ... }:
let

  # Unfortunately, you have to use the absolute path. Anchoring a relative path does not work.
  # If the dotfilesPath directory is adjusted, then this will fail (and the symlinks will not point to anything)
  dotfilesPath = "${config.home.homeDirectory}/NixOS/devices/pc/home/dotfiles";

  doomPath = "${dotfilesPath}/doom/";

  glidePath = "${dotfilesPath}/glide/";

  niriPath = "${dotfilesPath}/niri/";

  nvimPath = "${dotfilesPath}/nvim/";

in
{

  xdg.configFile."doom".source = config.lib.file.mkOutOfStoreSymlink doomPath;

  xdg.configFile."glide".source = config.lib.file.mkOutOfStoreSymlink glidePath;

  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink niriPath;

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimPath;

}
