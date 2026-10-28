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
    sfizz-ui

    # Multi-paradigm, semi-modular synth. I love the acid sounds on it.
    surge-xt

    # Adds many high-quality mixing and mastering effects
    lsp-plugins

    # Adds many high quality reverb algorithms
    dragonfly-reverb

  ];

  # adding multiple plugin formats below
  # run a command like this:
  # find "$(nix eval --raw nixpkgs#lsp-plugins)" -type f -type f \( -name '*.vst' -o -name '*.clap' -o -name '*.lv2' -o -name '*.vst3'\)

  home.file =
    linkFiles ".clap" "${pkgs.dragonfly-reverb}/lib/clap" [
      "DragonflyRoomReverb.clap"
      "DragonflyPlateReverb.clap"
      "DragonflyHallReverb.clap"
      "DragonflyEarlyReflections.clap"
    ]

    // linkFiles ".clap" "${pkgs.surge-xt}/lib/clap" [
      "Surge XT.clap"
      "Surge XT Effects.clap"
    ]

    // linkFiles ".lv2" "${pkgs.surge-xt}/lib/lv2" [
      "Surge XT Effects.lv2"
      "Surge XT.lv2"
    ]

    // linkFiles ".vst3" "${pkgs.surge-xt}/lib/vst3" [
      "Surge XT Effects.vst3"
      "Surge XT.vst3"
    ]
    // linkFiles ".lv2" "${pkgs.sfizz-ui}/lib/lv2" [
      "sfizz.lv2"
    ]
    // linkFiles ".vst3" "${pkgs.sfizz-ui}/lib/vst3" [
      "sfizz.vst3"
    ]
    // linkFiles ".clap" "${pkgs.lsp-plugins}/lib/clap" [
      "lsp-plugins.clap"
    ];

  #TODO: add desktop entry disabling lsp-plugins, annoying to see it in dmenu / krunner
}
