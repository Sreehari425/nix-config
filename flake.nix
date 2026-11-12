{
  description = "Sreehari's Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixgl = {
      url = "github:Sreehari425/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    quantum-launcher.url = "github:mrmayman/quantumlauncher";
    helix-fork = {
      url = "github:Sreehari425/helix";
      inputs.nixpkgs.follows = "nixpkgs"; # avoid duplicate nixpkgs eval, if your fork's flake takes it
    };
    mpd-mpris.url = "github:Sreehari425/mpd-mpris";
    excali-desktop.url = "github:Sreehari425/excali-desktop";

  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixgl,
      catppuccin,
      quantum-launcher,
      lanzaboote,
      helix-fork,
      mpd-mpris,
      excali-desktop,
      ...

    }: # Destructure nixgl here
    let
      system = "x86_64-linux";
      homePkgs = import nixpkgs (
        { inherit system; } // (import ./home/home-packages.nix) { inherit helix-fork; }
      );

      systemPkgs = import nixpkgs ({ inherit system; } // (import ./nixos/system-packages.nix));

    in
    {
      homeConfigurations = {
        sreehari-nixos-tp-orion = home-manager.lib.homeManagerConfiguration {
          pkgs = homePkgs;
          extraSpecialArgs = {
            inherit nixgl mpd-mpris excali-desktop;
            quantumLauncher = quantum-launcher;
            isNixOS = true;
            nixName = "tp-orion";
          };
          modules = [
            catppuccin.homeModules.catppuccin
            excali-desktop.homeManagerModules.default
            mpd-mpris.homeManagerModules.default
            ./home/home.nix
          ];
        };

        sreehari-nixos-pc-phoenix = home-manager.lib.homeManagerConfiguration {
          pkgs = homePkgs;
          extraSpecialArgs = {
            inherit nixgl mpd-mpris excali-desktop;
            quantumLauncher = quantum-launcher;
            isNixOS = true;
            nixName = "pc-phoenix";
          };
          modules = [
            catppuccin.homeModules.catppuccin
            excali-desktop.homeManagerModules.default
            mpd-mpris.homeManagerModules.default
            ./home/home.nix
          ];
        };

        sreehari-standalone-tp-orion = home-manager.lib.homeManagerConfiguration {
          pkgs = homePkgs;
          extraSpecialArgs = {
            inherit nixgl mpd-mpris excali-desktop;
            quantumLauncher = quantum-launcher;
            isNixOS = false;
            nixName = "tp-orion";
          };
          modules = [
            mpd-mpris.homeManagerModules.default
            excali-desktop.homeManagerModules.default
            catppuccin.homeModules.catppuccin
            ./home/home.nix
          ];
        };

        sreehari-standalone-pc-phoenix = home-manager.lib.homeManagerConfiguration {
          pkgs = homePkgs;
          extraSpecialArgs = {
            inherit nixgl mpd-mpris excali-desktop;
            quantumLauncher = quantum-launcher;
            isNixOS = false;
            nixName = "pc-phoenix";
          };
          modules = [
            mpd-mpris.homeManagerModules.default
            excali-desktop.homeManagerModules.default
            catppuccin.homeModules.catppuccin
            ./home/home.nix
          ];
        };
      };

      nixosConfigurations.tp-orion = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          flakeTarget = "tp-orion";
          nixName = "tp-orion";
        };

        modules = [
          ./nixos/configuration.nix
          ./hosts/tp-orion
          lanzaboote.nixosModules.lanzaboote
          { nixpkgs.pkgs = systemPkgs; }
        ];
      };

      nixosConfigurations.pc-phoenix = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          flakeTarget = "pc-phoenix";
          nixName = "pc-phoenix";
        };

        modules = [
          ./nixos/configuration.nix
          ./hosts/pc-phoenix
          lanzaboote.nixosModules.lanzaboote
          { nixpkgs.pkgs = systemPkgs; }
        ];
      };

    };

}
