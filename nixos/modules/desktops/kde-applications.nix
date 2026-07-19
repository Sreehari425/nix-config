{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    kdePackages.kate
    kdePackages.ktexteditor
    kdePackages.baloo-widgets
    kdePackages.dolphin-plugins
    kdePackages.ffmpegthumbs
    kdePackages.krdp
  ];
}
