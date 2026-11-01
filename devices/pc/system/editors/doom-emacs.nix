{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    emacs

    git
    ripgrep

    fd

    # fallback font for emacs. I don't see myself using this anywhere else, so installing it here instead of fonts/
    symbola
  ];

}
