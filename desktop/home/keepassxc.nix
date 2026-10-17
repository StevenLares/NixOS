{ ... }:
{
  programs.keepassxc = {
    enable = true;
    autostart = true;
    settings = {
      GUI = {
        AdvancedSettings = true;
        MinimizeOnStartup = true;
        ShowTrayIcon = true;
        MinimizeOnClose = true;
        TrayIconAppearance = "colorful";
      };
      Browser = {
        Enabled = true;
      };

    };
  };

}
