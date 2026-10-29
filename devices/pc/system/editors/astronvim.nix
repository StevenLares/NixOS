{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    #TODO: figure out what to keep, what to move to nvim's path
    neovim
    wl-clipboard
    ripgrep
    clang

    nerd-fonts.jetbrains-mono
    nerd-fonts.intone-mono
    cargo

    tree-sitter

  ];

}
