{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixd
    nixfmt
    clippy
    clang-tools
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        auto-format = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides.render = true;
        file-picker.hidden = false;
      };
    };
    languages = {
      language-server = {
        rust-analyzer = {
          config.check.command = "clippy";
          files.watcher = "server";
        };
        nixd.config.nixd = {
          diagnostics.suppress = [ ];
          installable.expr = "import <nixpkgs> {}";
          formatting.command = [ "nixfmt" ];
        };
      };
      language = [
        {
          name = "c";
          formatter = {
            command = "clang-format";
            args = [ "--style=file" ];
          };
          auto-format = true;
        }
        {
          name = "nix";
          language-servers = [ "nixd" ];
          formatter.command = "nixfmt";
          auto-format = true;
        }
      ];
    };
  };
}
