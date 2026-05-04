{pkgs, inputs, ... }:

{
  imports =
    [

    ];

  environment.systemPackages = with pkgs; [
    discord
    slack

  ];
}