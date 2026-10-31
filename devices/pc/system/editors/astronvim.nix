{ pkgs, ... }:
{
  #TODO: move these other parts of system/
  environment.systemPackages = with pkgs; [

    neovim
    wl-clipboard

    # TODO: actually maybe this one can be in home/?
    ripgrep

    clang

    tree-sitter

  ];

}
