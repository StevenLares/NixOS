{ pkgs, ... }:
{
  #TODO: Make these a "dependency folder" in system/, and move neovim to user folder
  environment.systemPackages = with pkgs; [

    neovim

    wl-clipboard

    ripgrep

    lazygit

    clang

    tree-sitter

    #TODO: remove this at some point, only needed for some lsps
    nodejs

    #TODO: remove this at some point, only needed for some lsps and parinfer
    cargo

  ];

}
