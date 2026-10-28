{ pkgs, ... }:
let
  linkFiles =
    linkDir: targetDir: filenames:
    builtins.listToAttrs (
      map (name: {
        name = "${linkDir}/${name}";
        value.source = "${targetDir}/${name}";
      }) filenames
    );
in
{

  home.packages = with pkgs; [

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

  home.file = linkFiles ".clap" "${pkgs.dragonfly-reverb}/lib/clap" [
    "DragonflyRoomReverb.clap"
    "DragonflyPlateReverb.clap"
    "DragonflyHallReverb.clap"
    "DragonflyEarlyReflections.clap"
  ];

  # // linkFiles ".config/REAPER/UserPlugins" "${pkgs.reaper-sws-extension}/UserPlugins" [
  #   "reaper_sws-x86_64.so"
  # ];
  #TODO: add other plugins
}
