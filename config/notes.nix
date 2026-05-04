{pkgs, inputs, ... }:

{

  environment.systemPackages = with pkgs; [
    pkgs.obsidian
    mermaid-cli
    mdcat
    kdePackages.okular
    libsForQt5.qt5.qtspeech
    pkgs.nodejs_24

    #customPackegaes
    (import ./binCode/impovedCat.nix { inherit pkgs; })
    (import ./binCode/nixTemplates.nix { inherit pkgs; })
  ];
}
