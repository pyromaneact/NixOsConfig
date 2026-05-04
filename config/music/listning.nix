{pkgs, inputs, ... }:

{

  environment.systemPackages = with pkgs; [
    spotify
    spotifyd
    pkgs.yt-dlp
  ];
}