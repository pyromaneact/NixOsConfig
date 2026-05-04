{pkgs, inputs, ... }:

{
  imports =[ 

  ];

  programs.fish.enable = true;

  programs.fish.shellAliases = {
        sudoit = "sudo $history[1]";
        vimit = "echo $history[1]| cut -d ' ' -f 2- | xargs vim";
  };

  programs.tmux = {
    enable=true;
    terminal="${pkgs.fish}/bin/fish";
  };


  environment.systemPackages = with pkgs; [
    pkgs.fish
    pkgs.tmux

  ];
}
