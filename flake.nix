{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    xremap-flake.url = "github:xremap/nix-flake";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, nvf, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };

  in
  {
    nixosConfigurations = {
      myNixos = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit system; 
          inherit inputs;
        };
        modules = [
          #generic configs
          ./config/configuration.nix
          ./config/nividia.nix
          #./config/genericPackage.nix

          #settings configs
          ./config/laptopDrivers.nix
          ./config/terminal.nix
          ./config/usr.nix
          #./config/networking.nix
          ./config/xremap/keyboardConfig.nix

          #program configs
          nvf.nixosModules.default
          ./config/vulriblitys.nix
          ./config/codeConfig.nix
          ./config/notes.nix
          ./config/presentations.nix
          ./config/comunication.nix
          ./config/making/making.nix
          ./config/music/music.nix
          ./config/cyberSecurity.nix
          ./config/game.nix
          ./config/vm.nix
        ];
      };
    };

  };
}
