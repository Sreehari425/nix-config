{ config, pkgs, ... }:

{

  imports = [
    ./dotfiles.nix
  ];

  home.username = "sreehari";
  home.homeDirectory = "/home/sreehari";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    helix
    fastfetch
    git
  ];
}
