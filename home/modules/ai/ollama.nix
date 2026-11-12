{ config, isNixOS, lib, nixgl, pkgs, ... }:

let
  cfg = config.my.ai.ollama;
  ollamaPackage = if cfg.vulkan then pkgs.ollama-vulkan else pkgs.ollama;
  ollamaWrappedPackage =
    if isNixOS then
      ollamaPackage
    else
      pkgs.writeShellScriptBin "ollama" ''
        exec ${nixgl.packages.${pkgs.stdenv.hostPlatform.system}.nixGLIntel}/bin/nixGLIntel ${ollamaPackage}/bin/ollama "$@"
      '';


  ollamaEnvironment =
    [ "OLLAMA_CONTEXT_LENGTH=${toString cfg.contextLength}" ]
    ++ lib.optional cfg.vulkan "OLLAMA_VULKAN=1"
    ++ lib.optional cfg.igpu "OLLAMA_IGPU_ENABLE=1";
in
{
  options.my.ai.ollama = {
    enable = lib.mkEnableOption "the Ollama user service";

    contextLength = lib.mkOption {
      type = lib.types.ints.positive;
      default = 16384;
      description = "Default context length for the Ollama server.";
    };

    vulkan = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Vulkan acceleration for Ollama.";
    };

    igpu = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Ollama's integrated-GPU support.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ ollamaWrappedPackage ];

    systemd.user.services.ollama = {
      Unit = {
        Description = "Ollama local model server";
        After = [ "network.target" ];
      };

      Service = {
        ExecStart = "${ollamaWrappedPackage}/bin/ollama serve";
        Restart = "on-failure";
        Environment = ollamaEnvironment;
      };

      Install.WantedBy = [ "default.target" ];
    };
  };
}
