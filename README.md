# NixOS

## Setting up a new NixOS personal computer

Right after each configuration.nix adjustment, run
```bash
sudo nixos-rebuild switch
```


Adjust hostname in configuration.nix:
```nix
networking.hostName = "whatever"; # Define your hostname.

```

Then restart your machine


Add experimental features to your configuration.nix:

```nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
```

Pull this repo down using HTTPS or SSH

Make a new folder under hosts/personal-computers/<hostname>, and copy your configuration.nix and hardware-configuration.nix files to that folder

Rename configuration.nix as default.nix

Symlink your /etc/nixos folder to this git repo. That means you'll delete the contents currently inside there.

You will have to add a new entry in flake.nix, to import your new PC. Compare with other 'personal-computers' entries already there.

Also, you might want to remove some of the stuff in your <hostname>/default.nix, since the common.nix folder (one level up) already has most stuff in there.
