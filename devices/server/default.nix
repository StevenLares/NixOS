{ host, ... }:
{
  #TODO: VM names should be extracted out to a global param, so that links can be generated
  # for firefox and other desktop programs

  imports =
    if host == "adblocker-VM" then
      [
        ./adblocker
        ./zShared
      ]
    else if host == "bookmark-manager-VM" then
      [
        ./bookmark-manager
        ./zShared
      ]
    else if host == "cloud-gaming-VM" then
      [
        ./cloud-gaming
        ./zShared
      ]
    else if host == "e-reader-VM" then
      [
        ./e-reader
        ./zShared
      ]
    else if host == "local-backups-VM" then
      [
        ./local-backups
        ./zShared
      ]
    else if host == "music-streaming-VM" then
      [
        ./music-streaming
        ./zShared
      ]
    else if host == "rss-feed-VM" then
      [
        ./rss-feed
        ./zShared
      ]
    else if host == "software-forge-VM" then
      [
        ./software-forge
        ./zShared
      ]
    else if host == "tailscale-exit-node-VM" then
      [
        ./tailscale-exit-node
        ./zShared
      ]
    else if host == "video-streaming-VM" then
      [
        ./video-streaming
        ./zShared
      ]
    else
      [ ];

}
