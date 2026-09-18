{pkgs, inputs, ... }:
let
  strudle = pkgs.vimUtils.buildVimPlugin {
    pname = "strudel.nvim";
    version = "1.0.0";
    src = pkgs.fetchFromGitHub {
      owner = "gruvw";
      repo = "strudel.nvim";
      hash = "sha256-rFVYNwNkIYqJxH6bSNmXJ/e2T919NTeH+Uz1nF/JC+0=";
      fetchSubmodules = true;
    };
  };
in
{      

  programs.nvf ={
    config.vim.lazy.plugins = {
      package = strudle;
      setupModule = "strudel/init.lua";
      load = ""

      build = "npm ci";
      config = ''' function()
        require("strudel").setup()
        end ''';
    };
  };


  environment.systemPackages = with pkgs; [
    nodejs
  ];
  
}
