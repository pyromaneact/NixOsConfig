{pkgs, inputs, ... }:

{

  #install steam and configure gaming
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    steam
    mangohud

    #Games
    oh-my-git
  ];
}