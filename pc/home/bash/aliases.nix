{
  self-hosted-ports,
  username,
  central-server_ip,
  dietpi-server_ip,
  ...
}:
let
  syncthing-forwarded_port = self-hosted-ports.syncthing-forwarded_port;
  syncthing-server_port = self-hosted-ports.syncthing-server_port;

  local_music_mount = "/home/${username}/Mount/Music";
  remote_music_src = "${username}@${central-server_ip}.local:/home/${username}/Media/Music";
in
{

  programs.bash.enable = true;

  programs.bash.shellAliases = {

    #TODO: If avahi gets its full module back, remove all .local in this file

    # Server connections
    server_connect = "ssh ${username}@${central-server_ip}.local";

    # https://forum.syncthing.net/t/getting-started-on-headless-linux/13325/12
    server_syncthing = "ssh -L ${syncthing-forwarded_port}:localhost:${syncthing-server_port} ${username}@${central-server_ip}.local";

    # I use a modified dietpi user... for now
    pi_connect = "ssh dietpi@${dietpi-server_ip}";

    # TODO: Might be adjusted depending on how I handle Duplicacy
    # Backups
    backup_general_to_HDD = "duplicacy backup -storage default";
    dry_backup_general_to_HDD = "duplicacy backup -dry-run -storage default";

    backup_general_to_B2 = "duplicacy backup -storage B2";
    dry_backup_general_to_B2 = "duplicacy backup -dry-run -storage B2";

    # Mounting Remote Drives

    # These commmands use this resource as a reference:
    # https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh

    # mount ~/Media/Music folder from home server
    mount_music = "mkdir -p ${local_music_mount} && sshfs ${remote_music_src} ${local_music_mount}";

    # Unmount /mnt/Music/
    unmount_music = "umount ${local_music_mount}";
  };
}
