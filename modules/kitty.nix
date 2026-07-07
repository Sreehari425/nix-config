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
      remember_window_size = "no";
      initial_width = "900";
      initial_height = "600";
      enable_audio_bell = "no";
    };
  };

  # Optional: Automatically ensures the font is installed for your user profile
  home.packages = [
    pkgs.nerd-fonts.fira-code
  ];
}
