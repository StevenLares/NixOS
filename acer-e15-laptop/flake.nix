{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-26.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    # You can either add a specific nixpkgs hash
    # or a nix flake of a specific package (if you want an even newer version of it)
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations.acer-e15-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
        ];
      };
    };
}
