# NixOS

## What is this

This is my homelab setup. This is mostly meant for myself, although I keep it up for learning purposes.

I will work towards making the README more legible, right now it makes enough sense to me.


## Setting up a new NixOS machine (both clients and servers)

Before starting, make sure this new machine has a hostname in mind. 
You may need to grep this codebase for:
`if host == `
As that is host-specific behavior you may want for this new machine.

`shared-configs/` also has some host specific logic embedded in the attribute sets.
Host-specific logic tends to "live together" in the same files, so this stuff isn't as spread out as it may seem from this description.

You will also have to modify flake.nix and other parts of the code to accomodate your new machine. See existing code for inspiration.

Note that servers are a bit different than clients: clients are near-clones of each other (with minor differences outlined through if-expressions) while servers are usecase specific (and thus have their specific logic separated by folders, which are imported through if-expressions.)
(side note: if you are adding a server you should probably make a new folder for it).

> Prefer the GUI install, as it generates more info into your config. 
> It also makes you set up a password, which is thankfully not stored in your config!

Modify `sudo nano /etc/configuration.nix` to have:
vim, git, wget

as well as add nix flakes and new nix-command line:

```nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
```


Run the following to rebuild NixOS
```bash
sudo nixos-rebuild switch
```

Then, git pull this repo into ~/NixOS using HTTPS (or ssh, which you'll probably install eventually).


Adjust hostname in /etc/configuration.nix to what you chose in the beginning of this process:
```nix
networking.hostName = "whatever"; # Define your hostname.

```

and rebuild NixOS


Then restart your machine

If this is a physical machine, you may have to add your auto-generated configs to your nix config. 
Either use your new machine to do so, or another one. Use grep to see how this is done in the codebase.
grep for:
`auto-generated`

If it's a server, chances are the auto-generated configs are the same as the other server VM configs. If that's the case, you can skip this step.

Now, delete /etc/nixos , which you need sudo for

Then, symlink /etc/nixos to ~/NixOS

Run 

`sudo nixos-rebuild switch`

if you followed all steps, everything should be rebuilt and your host will automatically be provisioned (lol, 'automatically')


