{ pkgs, ... }:
{
  # TODO: move stuff to home
  environment.systemPackages = with pkgs; [

    neovim
    wl-clipboard
    ripgrep
    clang

    tree-sitter

  ];

}
