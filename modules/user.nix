{ pkgs, ... }:
{
 # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tim = {
    isNormalUser = true;
    description = "Tim";
    extraGroups = [ "networkmanager" "input" "wheel" ];
    packages = with pkgs; [];
  };
}
