{ pkgs, ... }:

{
  services.swaync = {
    enable = true;

    settings = {
      timeout = 5;
      max-history = 5;
    };

    style = ''
      .notification {
        padding: 10px;
        margin: 5px;
        border: 2px solid #ffffff;
      }

      .notification-content {
        color: white;
        font-weight: bold;
      }

      .dnd-button {
        background: @surface1;
        border-radius: 8px;
        padding: 4px;
      }
    '';
  };

  home.packages = [
    pkgs.swaynotificationcenter
  ];
}
