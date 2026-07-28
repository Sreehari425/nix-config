{ pkgs, ... }: {
  xdg.icons.enable = true;
  xdg.mime.enable = true;

  xdg.portal = {
    enable = true;

    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      kdePackages.xdg-desktop-portal-kde
    ];
    config = {
      common = {
        default = [
          "hyprland"
          "kde"
          "gtk"
        ];
      };
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
      };
      plasma = {
        default = [
          "kde"
          "gtk"
        ];
      };
    };
  };
}
