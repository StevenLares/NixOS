{ ... }:
{

  # Creates desktop entries for all flatpaks, including user level ones.
  # Therefore do not remove, even if you only install entries per user.
  services.flatpak.enable = true;
}
