{pkgs, inputs, ... }:

{
  imports =[ 

  ];

  environment.systemPackages = with pkgs; [

  ];


  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  networking = {
    interfaces.enp61s0 = {
      ipv4.addresses = [{
        address = "192.168.100.10";
        prefixLength = 24;
      }];
    };
    defaultGateway = {
      address = "192.168.68.1";
      interface = "wlp62s0";
    };
  };
}
