{pkgs, inputs, ... }:

{
  imports =
    [
    ];
  users.users.cyber_coo.extraGroups = ["kvm"];
  virtualisation.vmware.host.enable = true;
  #programs.looking-glass-client.enable = true;
  environment.systemPackages = with pkgs; [
    pkgs.looking-glass-client
    pkgs.qemu_xen
    vmware-workstation
  ];
}
