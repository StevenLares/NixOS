{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    # Reaper needs all of this to be useful
    # I don't want to undercut it though;
    # Reaper is a highly customizable timeline DAW
    # Not free, so go to the website to download license file and add it to program
    reaper
    reaper-reapack-extension
    reaper-sws-extension

    # SFZ sampler. Useful, since I have a lot of SFZ instruments.
    sfizz

    # Multi-paradigm, semi-modular synth. I love the acid sounds on it.
    surge-xt

    # Basically a VST version of Renoise. Therefore, it is meant to be used in another DAW as an instrument.
    # I just use it to make break presets and then freeze them as audio clips in Reaper.
    # Also has SFZ capabilties, although I actually prefer sfizz for that.
    # Not free. See nix package's source code for instructions on how to add license file:
    # https://github.com/NixOS/nixpkgs/blob/nixos-26.05/pkgs/by-name/re/redux/package.nix
    redux

    # Adds many high-quality mixing and mastering effects
    lsp-plugins

    # Adds many high quality reverb algorithms
    dragonfly-reverb
  ];

  #TODO: add infamousPlugins somehow

  #TODO: add NeuralNote somehow
}
