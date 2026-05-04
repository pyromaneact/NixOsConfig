{pkgs, inputs, ... }:
let
 keyremap = builtins.readFile ./mainremap.yml;
in
{
  imports =[ 
      inputs.xremap-flake.nixosModules.default
  ];

    # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  #enable and setup xremap shortcut system
  services.xremap = {
    withGnome = true;
    userName = "cyber_coo";
    yamlConfig = keyremap;
    debug = true;
  };

  environment.systemPackages = with pkgs; [

  ];
}
