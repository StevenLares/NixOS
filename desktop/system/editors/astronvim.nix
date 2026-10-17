{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    neovim
    wl-clipboard
    bottom
    ripgrep
    python3
    nodejs
    clang

    nerd-fonts.jetbrains-mono
    nerd-fonts.intone-mono
    cargo

    lazygit
    tree-sitter

  ];

}
