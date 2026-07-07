# Accept 'nixgl' from our extraSpecialArgs
{ pkgs, nixgl, ... }:

{
  programs.kitty = {
    enable = true;

    # Clean wrapper leveraging your Flake inputs directly
    package = pkgs.writeShellScriptBin "kitty" ''
      exec ${nixgl.packages.${pkgs.system}.nixGLDefault}/bin/nixGL ${pkgs.kitty}/bin/kitty "$@"
    '';

    font = {
      name = "FiraCode Nerd Font Mono";
      size = 11;
    };

    settings = {
      background_opacity = "0.3";
      background_blur = 1;
      enable_audio_bell = "no";
    };
  };

  home.packages = [
    pkgs.nerd-fonts.fira-code
  ];
}
