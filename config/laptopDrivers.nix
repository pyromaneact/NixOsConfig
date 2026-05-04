{pkgs, inputs, ... }:

{
  imports =[ 

  ];
  hardware.tuxedo-drivers.enable=true;

  environment.systemPackages = with pkgs; [
    pkgs.linuxKernel.packages.linux_6_12.tuxedo-drivers
    pkgs.tailor-gui
  ];
}
