{ host, server-hostnames, ... }:
let

  sharedModules = if builtins.elem host server-hostnames then [ ./zShared ] else [ ];

  specificModule =
    if host == "adblocker-VM" then
      [
        ./adblocker
      ]
    else if host == "bookmark-manager-VM" then
      [
        ./bookmark-manager
      ]
    else if host == "cloud-gaming-VM" then
      [
        ./cloud-gaming
      ]
    else if host == "e-reader-VM" then
      [
        ./e-reader
      ]
    else if host == "local-backups-VM" then
      [
        ./local-backups
      ]
    else if host == "music-streaming-VM" then
      [
        ./music-streaming
      ]
    else if host == "rss-feed-VM" then
      [
        ./rss-feed
      ]
    else if host == "software-forge-VM" then
      [
        ./software-forge
      ]
    else if host == "tailscale-exit-node-VM" then
      [
        ./tailscale-exit-node
      ]
    else if host == "video-streaming-VM" then
      [
        ./video-streaming
      ]
    else
      [ ];
in
{
  imports = sharedModules ++ specificModule;
}
