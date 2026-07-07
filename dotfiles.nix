{ config, ... }:

{
  xdg.configFile = {
    "hypr".source = ./configs/hypr;

    "waybar".source = ./configs/waybar;

    "rofi".source = ./configs/rofi;
  };
}
