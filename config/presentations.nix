{pkgs, inputs, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [
    "googleearth-pro-7.3.6.10201" # Includes vulnerable versions of bundled libraries: openssl, ffmpeg, gdal, and proj.
  ];

  environment.systemPackages = with pkgs; [
    googleearth-pro
    pkgs.blender
    libreoffice
    pkgs.gimp3-with-plugins
    pkgs.presenterm
  ];
}
