{ pkgs, ... }: {

  home.packages = with pkgs; [

    # Could be a backup to redux / renoise. Less complexity with maintenance, plus it's FOSS.
    milkytracker

  ];
}
