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
      rev = "ddd9d5cbb9d27818d4f49a287da2662f5554c147";
      sha256 = "sha256-pcALvo+YFL/tnyl5SKGfxWdMAvnrD/cqOWxvVLcm1ZI=";
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
