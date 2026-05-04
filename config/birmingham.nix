{pkgs, inputs, ... }:

{
  imports =
    [

    ];
  environment.systemPackages = with pkgs; [
    pkgs.ghidra
    pkgs.hterm
    pkgs.cutecom
  ];
}
