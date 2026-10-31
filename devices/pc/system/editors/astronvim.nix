{ pkgs, ... }:
{
  #TODO: move these other parts of system/
  environment.systemPackages = with pkgs; [

    neovim

    # TODO: No idea where
    wl-clipboard

    # TODO: actually maybe this one can be in home/programs/development?
    ripgrep

    #TODO:: wish I didn't need clang globally. Partially makes me want to try out Doom Emacs
    clang

    # TODO: maybe home/programs/development ?
    tree-sitter

  ];

}
