{ ... }:
{
  # Decided not to point to the path. There is a risk it could create a vault while syncthing is still writing to that folder, resulting in a sync conflict
  # Plus, it's pretty janky.
  programs.obsidian.enable = true;

}
