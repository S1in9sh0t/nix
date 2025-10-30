{ config, pkgs, ... }:

{
  home.username = "benzo";
  home.homeDirectory = "/home/benzo";
  programs.git.enable = true;
  home.stateVersion = "25.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
    };
  };
}
