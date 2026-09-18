{pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./codeEditor.nix
    ];

  #allow docker demon to run
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    man-pages
    vscode
    docker #enable docke with virtualisation.docker.enable
    docker-compose
    git
    python3
    gcc_multi
    cmake
    gnumake
    clang
    pkgs.hexedit
    vimgolf
    pkgs.python313Packages.pefile
  ];
}
