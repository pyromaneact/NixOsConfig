{pkgs, inputs, ... }:
{
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;



  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    #generic comandline packages
    vim 
    wget
    chafa
    unzipNLS
    pkgs.zip
    pkgs.lshw


    #plasma5Packages.plasma-thunderbolt
    #plasma5Packages.plasma-thunderbolt
  ];
}
