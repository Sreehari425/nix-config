{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nix-config/home/configs";
in
{
  xdg.configFile = {
    "hypr".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hypr";
    "waybar".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/waybar";
    "rofi".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/rofi";
    "oh-my-posh/1_shell.omp.json".source = ./configs/oh-my-posh/1_shell.omp.json;
    "nixpkgs/config.nix".text = ''
      {
        allowUnfree = true;
      }
    '';
  };
  xdg.dataFile = {
    "icons/hypr-dots-black".source = ./configs/cursors/hypr-dots-black;
  };

  home.packages = [
    pkgs.papirus-icon-theme
  ];
}
