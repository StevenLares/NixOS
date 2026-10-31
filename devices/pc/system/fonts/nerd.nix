{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nerd-fonts.blex-mono
    nerd-fonts.caskaydia-mono
    nerd-fonts.commit-mono
    nerd-fonts.daddy-time-mono
    nerd-fonts.departure-mono
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.envy-code-r
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.fira-mono
    nerd-fonts.geist-mono
    nerd-fonts.hack
    nerd-fonts.intone-mono
    nerd-fonts.profont
    nerd-fonts.recursive-mono
    nerd-fonts.terminess-ttf

  ];
}
