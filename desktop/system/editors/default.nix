{ ... }:
{
  # Just IDEs and other text / code editors
  imports = [
    ./default-editor.nix

    ./astronvim.nix
    ./kate.nix
    ./vim.nix
  ];
}
