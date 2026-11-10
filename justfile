# Got this from:
# https://nixos-and-flakes.thiscute.world/best-practices/simplify-nixos-related-commands
# (with some modifications)

############################################################################
#
#  Nix commands related to the local machine
#
############################################################################

deploy:
    nixos-rebuild switch --flake . --sudo

debug:
    nixos-rebuild switch --flake . --sudo --show-trace --verbose

list-generations:
    nixos-rebuild list-generations --flake . --sudo 

up:
    nix flake update

# Update specific input
# usage: make upp i=home-manager
upp:
    nix flake update $(i)

history:
    nix profile history --profile /nix/var/nix/profiles/system

repl:
    nix repl -f flake:nixpkgs

clean:
    # remove all generations older than 7 days
    sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
    # garbage collect all unused nix store entries
    sudo nix-collect-garbage --delete-old
