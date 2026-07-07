{ pkgs, ... }:

{
  imports = [
    ./dotfiles.nix
    ./modules/bash.nix
    ./modules/git.nix
    ./modules/helix.nix
  ];

  home.username = "sreehari";
  home.homeDirectory = "/home/sreehari";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    fastfetch
  ];
}
