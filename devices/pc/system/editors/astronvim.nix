{ pkgs, ... }:
{
  # TODO: move stuff to home
  environment.systemPackages = with pkgs; [

    neovim
    wl-clipboard
    ripgrep
    clang

    nerd-fonts.jetbrains-mono
    nerd-fonts.intone-mono

    tree-sitter

  ];

}
