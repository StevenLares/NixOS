{ pkgs, ... }: {

  # Download and manage various Proton-GE builds.
  # Proton-GE are just extensions to the regular Proton builds Valve releases.
  # Usually those are just license-incompatible features, like a video codec.

  home.packages = with pkgs; [
    protonup-qt

  ];
}
