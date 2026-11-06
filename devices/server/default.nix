{ host, ... }:
{

  imports =
    if host == "adblocker-VM" then
      [
        ./adblocker
        ./zShared
      ]
    else if host == "local-backups-VM" then
      [
        ./local-backups
        ./zShared
      ]
    else if host == "private-web-services-VM" then
      [
        ./private-web-services
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
    else
      [ ];

}
