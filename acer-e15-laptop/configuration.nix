# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "acer-e15-laptop"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."steven" = {
    isNormalUser = true;
    description = "steven";
    extraGroups = [
      "networkmanager"
      "wheel"
      # these inputs are needed for kmonad
      "input"
      "uinput"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # TODO: Split these out into modules
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.

    neovim
    wl-clipboard
    bottom
    ripgrep
    python3
    nodejs
    clang

    nerd-fonts.jetbrains-mono
    nerd-fonts.intone-mono

    wget
    git

    # TODO: Wait until you set this up on everything else
    # restic
    flatpak
    proton-vpn

    lazygit
    tree-sitter
  ];

  # Set the default editor to vim
  environment.variables.EDITOR = "nvim";

  # Limit the number of generations to keep
  boot.loader.grub.configurationLimit = 10;

  # Perform garbage collection weekly to maintain low disk usage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Optimize storage
  # You can also manually optimize the store via:
  #    nix-store --optimise
  # Refer to the following link for more details:
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  nix.settings.auto-optimise-store = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  services.tailscale.enable = true;

  services.syncthing.enable = true;

  services.kmonad = {
    enable = true;
    keyboards = {
      acer-e15-laptop_kbd = {
        device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
        config = ''
            
          (defcfg
            input  (device-file "/dev/input/by-path/platform-i8042-serio-0-event-kbd" )
            output (uinput-sink "kmonad kbd")
            fallthrough true
            allow-cmd false
          )

          (defsrc
            esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12  ssrq pause del home pgup pgdn end power
            grv  1    2    3    4    5    6    7    8    9    0    -    =                 bspc   nlck kp/  kp*  kp-
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \                   kp7  kp8  kp9  kp+
            caps a    s    d    f    g    h    j    k    l    ;    '                      ret    kp4  kp5  kp6
            lsft z    x    c    v    b    n    m    ,    .    /    rsft                 up       kp1  kp2  kp3  kprt
            lctl fn lmet lalt      spc    ralt cmp  rctl                           left down rght   kp0  kp.
          )

          (deflayer base
            _  _   _   _   _   _   _   _   _   _   _  _  _  _ _ _ _ _ _ _ _
            _  _    _    _    _    _    _    _    _    _    _    -    _                 _   _ _  _  _
            @tab_navigation  _    _    _    _    _    _    _    _    _    _    _    _    _                   _  _  _  _
            esc _    _    _    _    _    _    _    _    _    _    _                      _    _  _  _
            _ _    _    _    _    _    _    _    _    _    _    _                 _       _  _  _  _
            _ _ _ _      _    _ _  cmp                           _ _ _   _  _
          )

          (deflayer navigation
            _  _   _   _   _   _   _   _   _   _   _  _  _  _ _ _ _ _ _ _ _
            _  _    _    _    _    _    _    _    _    _    _    -    _                 _   _ _  _  _
            _  _    _    _    _    _    _    _    _    _    _    _    _    _                   _  _  _  _
            _ _    _    _    _    _    left    down    up    rght    _    _                      _    _  _  _
            _ _    _    _    _    _    _    _    _    _    _    _                 _       _  _  _  _
            _ _ _ _      _    _ _  _                           _ _ _   _  _
          )


          (defalias
            tab_navigation (tap-hold-next-release 200 tab (layer-toggle navigation))
          )
        '';
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
