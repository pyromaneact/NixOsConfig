{pkgs, inputs, ... }:
let
  platformio-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "platformio.nvim";
    version = "1.0.0";
    src = pkgs.fetchFromGitHub {
      owner = "sbatin";
      repo = "platformio.nvim";
      rev = "546e1e0b5afdd970f140d0ccaf322d41c0f23941";
      hash = "sha256-PXsuhYmI3uLwjFZgSlliya2YlMWPRHTHKiUGSOJ6/ig=";
      fetchSubmodules = true;
    };
  };
in
{

  config.programs.nvf ={
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
        diagnostics = {
          enable = true;
          config = {
            virtual_lines = true;
          };
        };
        lsp.enable=true;
        languages = {
          enableTreesitter = true;

          nix.enable = true;
          clang={
            enable = true;
          };
          cmake.enable = true;
        };
        lazy.plugins = {
          "platformio.nvim" = {
            package = platformio-nvim;
            setupModule = "platformio";
          };
        };
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
      };

    };
  };
    

  config.environment.systemPackages = with pkgs; [
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
  config.services.udev.packages = [ 
    pkgs.platformio-core
    pkgs.openocd
  ];
}
