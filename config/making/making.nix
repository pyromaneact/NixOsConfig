{pkgs, inputs, ... }:

{
  #allow intalling packages with known vulns 

  nixpkgs.config.permittedInsecurePackages = [
    "snapmaker-luban-4.15.0"
    #CVE-2023-5217
  ];

  environment.systemPackages = with pkgs; [
    snapmaker-luban
    prusa-slicer
    kicad
    pkgs.freerdp
  ];
}
