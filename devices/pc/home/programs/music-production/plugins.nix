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

    # Adds many high-quality mixing and mastering effects
    lsp-plugins

    # Adds many high quality reverb algorithms
    dragonfly-reverb

  ];

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
    ];
  #TODO: add other plugins
}
