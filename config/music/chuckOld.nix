{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation{
  name = "chuck";
  #src =  pkgs.fetchgit { url = "https://github.com/ccrma/chuck/tree/main/src"; };

  buildInputs = with pkgs; [
    bison
    flex
    libsndfile    
    ocamlPackages.alsa
    libpulseaudio
  ];

  src =
    pkgs.fetchFromGitHub {
      owner = "ccrma";
      repo = "chuck";
      rev = "fa8a716e1feef4c9e03d61597f4930dd5ab5e4b7";
      sha256 = "sha256-VHPG9Q1D9JQADl+MnhQeN0PLhJrspMx3qslia52ycvc=";
    }+"/src";

  phases = [
    "unpackPhase"
    "buildPhase"
    "installPhase"
    #"postFixup"
  ];


  buildPhase = ''
    #ls -la >&2
    make clean
    make linux-alsa linux-pulse
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp chuck $out/bin
  '';
}
