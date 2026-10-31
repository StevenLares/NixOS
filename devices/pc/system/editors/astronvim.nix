{ pkgs, ... }:
{
  #TODO: move these other parts of system/
  environment.systemPackages = with pkgs; [

    neovim
    wl-clipboard
    ripgrep
    clang

    tree-sitter

  ];

}
