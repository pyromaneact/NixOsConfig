{pkgs, inputs, ... }:

{

  programs.nvf ={
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
        lsp.enable=true;
        languages = {
          enableTreesitter = true;

          nix.enable = true;
          clang.enable = true;
          cmake.enable = true;
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [
    direnv
    vscode
    pkgs.gdb
    pkgs.platformio
    arduino-ide
    pkgs.avrdude
    (pkgs.python313.withPackages(
      pypkgs: with pypkgs;[
        platformio
    ]
    ))
  ];
  services.udev.packages = [ 
    pkgs.platformio-core
    pkgs.openocd
  ];
}
