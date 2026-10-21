{ username, ... }:
{

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${username}" = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
      #TODO: these inputs are needed for kmonad... I think. Verify this
      "input"
      "uinput"
    ];
  };
}
