{ ... }:
{
  # TODO: Replace this with something native, and not Feishen
  # Top is highest priority, bottom is lowest:
  # Nocturne: https://github.com/Jeffser/Nocturne --strong AI ban, good. UI looks nice -- in nixpkgs, and flathub
  # gelly: https://github.com/Fingel/gelly --strong AI ban, good. UI looks slightly phone-ish, but looks good-- in nixpkgs, and flathub
  # ratune: https://github.com/acmagn/ratune --terminal one,  looks beautiful for what it is-- distributed as github flake.nix, so went down in priority
  # SubTUI: https://github.com/MattiaPun/SubTUI  -- terminal, looks neat if minimal. -- distributed as github flake.nix, so went down in priority
  services.flatpak.packages = [
    {
      appId = "org.jeffvli.feishin";
      origin = "flathub";
    }
  ];
}
