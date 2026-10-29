{ ... }:
{

  # Local-first password manager. Creates an encrypted keepassxc database file you can freely backup and sync
  # It creates a symlink to a read-only file in the nix store. So, keepassxc will complain that it does not have read/write access.

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
