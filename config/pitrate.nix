{pkgs, inputs, ... }:

{
  services.deluge = {
   enable = true;
   web.enable = true;
  };
  users.users.cyber_coo.extraGroups = ["deluge"];

  environment.systemPackages = with pkgs; [
    deluge
  ];
}
