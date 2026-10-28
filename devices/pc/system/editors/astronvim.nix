{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    neovim
    wl-clipboard
    ripgrep
    clang

    nerd-fonts.jetbrains-mono
    nerd-fonts.intone-mono
    cargo

    lazygit
    tree-sitter

  ];

}
