{ ... }: {
  programs.zellij = {
    enable = true;
    settings = {

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
