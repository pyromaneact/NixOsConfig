{pkgs, inputs, ... }:

{
  imports =
    [ 
    ];
  users.users.cyber_coo.extraGroups = ["wireshark" "tty" "dialout" "root"];
  programs.wireshark.enable = true;
  programs.wireshark.dumpcap.enable = true ;  
  programs.wireshark.usbmon.enable = true;
  environment.systemPackages = with pkgs; [
    qFlipper
    pkgs.rtl-sdr
    pkgs.openvpn
    pkgs.wireshark
    pkgs.burpsuite
  ];
}
