{pkgs, inputs, ... }:

let 
     chuckCustom = pkgs.callPackage ./chuck.nix {};
in
{
  imports =
    [ 
      ./listning.nix
      ./test.nix
    ];
  environment.systemPackages = with pkgs; [
    audacity
    #portaudio #for composer wich has been swaped out for chuck
    #chuck
    #miniaudicle # chunk GUI
    pkgs.lmms
    chuckCustom
    pkgs.cardinal
  ];
}
