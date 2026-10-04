{pkgs, inputs, ... }:
let
  strudel = pkgs.vimUtils.buildVimPlugin {
    pname = "strudel.nvim";
    version = "1.0.0";
    src = pkgs.fetchFromGitHub {
      owner = "gruvw";
      repo = "strudel.nvim";
      hash = pkgs.lib.fakeHash;
      fetchSubmodules = true;
    };
  };
in
{      

  programs.nvf ={
    config.vim.extraPlugins = {
      package = strudel;
      setup = "require('strudel').setup()";
      after = ["strudel"];

    };
  };


  environment.systemPackages = with pkgs; [
    nodejs
  ];
  
}
