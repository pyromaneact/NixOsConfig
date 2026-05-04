{pkgs, inputs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cyber_coo = {
    isNormalUser = true;
    description = "Cyber Coo";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "tty" "dialout" "video"];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

}
