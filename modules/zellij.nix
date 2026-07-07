{ ... }: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      default_layout = "compact";
      pane_frames = false;

      # Overriding the floating pane toggle to Alt + G
      keybinds = {
        normal = {
          "bind \"Alt g\"" = {
            ToggleFloatingPanes = [ ];
          };
        };
        locked = {
          "bind \"Alt g\"" = {
            ToggleFloatingPanes = [ ];
          };
        };
      };
    };
  };
}
