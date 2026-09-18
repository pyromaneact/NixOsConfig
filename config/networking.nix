{pkgs, inputs, ... }:

{
  imports =[ 

  ];

  environment.systemPackages = with pkgs; [

  ];

  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  networking = {
    networkmanager.enable = true;

    hostName = "nixos";

#    wireless.enable = true;  # Enables wireless support via wpa_supplicant.

#    interfaces.enp61s0 = {
#      ipv4.addresses = [{
#        address = "192.168.100.10";
#        prefixLength = 24;
#      }];
#    };

#    defaultGateway = {
#      address = "192.168.68.1";
#      interface = "wlp62s0";
#    };

#    proxy{
#       noProxy = "127.0.0.1,localhost,internal.domain";
#       default = "http://user:password@proxy:port/";
#    };


#  Open ports in the firewall.
#  networking.firewall.allowedTCPPorts = [ ... ];
#  networking.firewall.allowedUDPPorts = [ ... ];
#  Or disable the firewall altogether.
#  networking.firewall.enable = false;
  };
}
