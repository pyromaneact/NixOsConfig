{pkgs, inputs, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [
    "snapmaker-luban-4.15.0" #CVE-2023-5217
    "googleearth-pro-7.3.7.1155"
  ];
}
