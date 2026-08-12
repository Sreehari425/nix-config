{ pkgs, ... }:

{
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  environment.systemPackages = [
    pkgs.mangohud
    (pkgs.heroic.override {
      extraPkgs =
        pkgs': with pkgs'; [
          gamescope
          gamemode
          mangohud
        ];
    })
  ];
}
