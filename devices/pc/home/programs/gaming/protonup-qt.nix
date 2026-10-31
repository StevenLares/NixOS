{ pkgs, ... }: {

  # Download and manage various Proton-GE builds.
  # Proton-GE are just extensions to the regular Proton builds Valve releases.
  # Usually those are just license-incompatible features, like a video codec.
  #TODO: maybe I'll replace this with a flake that just gives me the proton versions directly
  #TODO: Also.... this *feels* like it should be a system concern, but not sure
  home.packages = with pkgs; [
    protonup-qt

  ];
}
