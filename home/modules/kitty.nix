{
  pkgs,
  nixgl,
  isNixOS,
  ...
}:

let
  kittyPackage =
    if isNixOS then
      pkgs.kitty
    else
      pkgs.writeShellScriptBin "kitty" ''
        exec ${
          nixgl.packages.${pkgs.stdenv.hostPlatform.system}.nixGLIntel
        }/bin/nixGLIntel ${pkgs.kitty}/bin/kitty "$@"
      '';
in
{
  programs.kitty = {
    enable = true;

    package = kittyPackage;

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
