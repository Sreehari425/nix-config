{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fcitx5
    fcitx5-mozc
    fcitx5-gtk
    qt6Packages.fcitx5-configtool
  ];

  home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    INPUT_METHOD = "fcitx";
    SDL_IM_MODULE = "fcitx";
  };
  xdg.configFile."fcitx5".source = ../configs/fcitx5;

}
