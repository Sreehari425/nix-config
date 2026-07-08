{ pkgs, ... }:

{
  xdg.configFile = {
    "hypr".source = ./configs/hypr;

    "waybar".source = ./configs/waybar;

    "rofi".source = ./configs/rofi;
    "oh-my-posh/1_shell.omp.json".source = ./configs/oh-my-posh/1_shell.omp.json;
  };
  home.packages = [
    pkgs.papirus-icon-theme # this for rofi powermenu.sh so it wont show BOX

  ];

}
