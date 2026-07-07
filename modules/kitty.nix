# modules/kitty.nix
{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";

    font = {
      name = "FiraCode Nerd Font Mono";
      size = 11;
    };

    settings = {
      background_opacity = "0.3";
      background_blur = 1;
      enable_audio_bell = "no";

      # Fixed the window sizing config keys here:
      remember_window_size = "no";
      initial_window_width = "900";
      initial_window_height = "600";

      # Forces Kitty to use native Wayland, falling back to X11 if needed
      linux_display_server = "auto";
    };
  };

  home.packages = [
    pkgs.nerd-fonts.fira-code
  ];
}
