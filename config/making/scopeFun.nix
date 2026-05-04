{ pkgs ? import <nixpkgs> {} }:
#{pkgs, inputs, ... }:

pkgs.stdenv.mkDerivation{
  name = "chuck";
  #src =  pkgs.fetchgit { url = "https://github.com/ccrma/chuck/tree/main/src"; };

  buildInputs = with pkgs; [
    
  ];

  phases = [
    
    "buildPhase"
    "installPhase"
    "cleanupPhase"
  ];

  src = 
    pkgs.fetchFromGitHub {
      owner = "scopefun";
      repo = "scopefun-software";
      rev = "beta-140-g83002c39";
      sha1 = "sha1-6df66e4de4db1a6ad8306168ec5861c73779c98f";
    };

  buildPhase = ''
    mkdir /tmp/scopeFunMake
    cmake -D SCOPEFUN_BUILD_TYPE=Release -S. -B /tmp/scopeFunMake/
    make -f /tmp/scopeFunMake/Makefile 
    
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp chuck $out/bin
  '';

  cleanupPhase = ''
    rm -rf /tmp/scopeFunMake
  '';
}
