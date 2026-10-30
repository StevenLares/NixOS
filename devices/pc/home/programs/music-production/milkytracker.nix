{ pkgs, ... }: {

  home.packages = with pkgs; [

    #TODO: Add vst version, too.
    # Could be a backup to redux / renoise. Less complexity with maintenance, plus it's FOSS.
    milkytracker

  ];
}
