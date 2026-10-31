{ pkgs, ... }:
{
  # Decided it isn't worth my time to move these to home.
  # Also, nerdfonts are needed for neovim, although it's a given that I already have them installed system-wide.
  environment.systemPackages = with pkgs; [

    neovim

    wl-clipboard

    ripgrep

    lazygit

    clang

    tree-sitter

  ];

}
