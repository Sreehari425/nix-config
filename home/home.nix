{ pkgs, ... }:

{
  imports = [
    ./dotfiles.nix
    ./modules/bash.nix
    ./modules/git.nix
    ./modules/helix.nix
    ./modules/zellij.nix
    ./modules/kitty.nix
    ./modules/catppuccin.nix
    ./modules/quantum-launcher.nix
    ./modules/ime.nix
    ./modules/hyprland.nix
    ./modules/cli.nix
    # ./modules/zsh.nix  #dont want zsh for now ig lol
    ./modules/notifications.nix
    ./modules/cursor.nix
  ];

  home.username = "sreehari";
  home.homeDirectory = "/home/sreehari";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";
  };

}
