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

compare prev-gen after-gen:
    nix store diff-closures /nix/var/nix/profiles/system-{{ prev-gen }}-link /nix/var/nix/profiles/system-{{ after-gen }}-link 

up:
    nix flake update

upp flake-input:
    nix flake update {{ flake-input }}

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
