{ ... }:
{

  #TODO: Good place to inject IPs
  programs.bash.shellAliases = {

    # Server connections
    server_connect = "ssh steven@nuc-home-server.local";

    # https://forum.syncthing.net/t/getting-started-on-headless-linux/13325/12
    server_syncthing = "ssh -L 9988:localhost:43121 steven@nuc-home-server.local";

    pi_connect = "ssh dietpi@192.168.0.152";

    # Backups
    backup_general_to_HDD = "duplicacy backup -storage default";
    dry_backup_general_to_HDD = "duplicacy backup -dry-run -storage default";

    backup_general_to_B2 = "duplicacy backup -storage B2";
    dry_backup_general_to_B2 = "duplicacy backup -dry-run -storage B2";

    # Mounting Remote Drives

    # These commmands use this resource as a reference:
    # https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh

    # mount ~/Media/Music folder from home server
    mount_music = "sudo sshfs -o allow_other,IdentityFile=/home/steven/.ssh/id_rsa_to_home_lab steven@nuc-home-server.local:/home/steven/Media/Music /mnt/Music/";

    # Unmount /mnt/Music/
    unmount_music = "sudo umount /mnt/Music/";
  };
}
