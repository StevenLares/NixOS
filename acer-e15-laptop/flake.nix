{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-26.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    kmonad.url = "github:kmonad/kmonad/master/?dir=nix";

  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.acer-e15-laptop= nixpkgs.lib.nixosSystem {
	specialArgs = {inherit inputs; };
      	modules = [
		./configuration.nix
      ];
    };
  };
}
