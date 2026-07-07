{ config, ... }:

{
  xdg.configFile = {
    "hypr".source = ./configs/hypr;

    "waybar".source = ./configs/waybar;

    "rofi".source = ./configs/rofi;
    "oh-my-posh/1_shell.omp.json".source = ./configs/oh-my-posh/1_shell.omp.json;
  };
}
