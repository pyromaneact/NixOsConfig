{pkgs, inputs, ... }:

{
  imports =[ 

  ];

  environment.systemPackages = with pkgs; [
	pkgs.lmms
        pkgs.libopenmpt
        #pkgs.zxtune
        pkgs.rosegarden
  ];
}
