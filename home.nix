{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles.nix
  ];

  home.username = "sreehari";
  home.homeDirectory = "/home/sreehari";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    helix
    fastfetch
    nixd
    nixfmt
    clippy
    clang-tools
  ];

  programs.bash = {
    enable = true;

    shellAliases = {
      ff = "fastfetch";
      nf = "neofetch";
      hx = "helix";
      vmm = "virt-manager";
      zj = "zellij";

      jlog = "journalctl -xe";
      jboot = "journalctl -b";
      jf = "journalctl -f";
      jerr = "journalctl -p 3 -xb";
      hms = "home-manager switch --flake ~/nix-config#sreehari";

    };

  };
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    settings = builtins.fromJSON (builtins.readFile ./configs/oh-my-posh/1_shell.omp.json);
  };
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Sreehari Anil";
        email = "sreehari7102008@gmail.com";
      };

      init.defaultBranch = "main";

      gpg = {
        format = "ssh";
        "ssh".program = "ssh-keygen";
      };

      commit.gpgSign = true;

      filter."lfs" = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };

      sendemail = {
        smtpserver = "://gmail.com";
        smtpuser = "sreehari7102008@gmail.com";
        smtpencryption = "tls";
        smtpserverport = 587;
      };
    };

    signing = {
      key = "/home/sreehari/.ssh/id_rsa.pub";
      signByDefault = true;
    };
  };
  programs.helix = {
    enable = true;
    defaultEditor = true;

    # Matches your config.toml
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

        indent-guides = {
          render = true;
        };

        file-picker = {
          hidden = false;
        };
      };
    };

    # Matches your language servers and languages configuration
    languages = {
      language-server = {
        rust-analyzer = {
          config = {
            check = {
              command = "clippy";
            };
          };
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
          formatter = {
            command = "nixfmt";
          };
          auto-format = true;
        }
      ];
    };
  };

}
