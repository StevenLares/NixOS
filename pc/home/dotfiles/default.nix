# Some programs have their own config dotfiles and a configuration language.
# And sometimes, that's enough; they don't really need to be configured through home-manager or the Nix language.
# These dotfiles are included here to be linked by home-manager.
# This ensures that everything is in one Git repo.

{ config, ... }:
let

  # Unfortunately, you have to use the absolute path. Anchoring a relative path does not work.
  # If the dotfilesPath directory is adjusted, then this will fail (and the symlinks will not point to anything)
  dotfilesPath = "${config.home.homeDirectory}/NixOS/pc/home/dotfiles";
  nvimPath = "${dotfilesPath}/nvim/";

  glidePath = "${dotfilesPath}/glide/";
in
{
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimPath;

  xdg.configFile."glide".source = config.lib.file.mkOutOfStoreSymlink glidePath;
}
