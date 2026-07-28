{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mpc
    ncmpcpp
    rmpc
    mpd-mpris
  ];

  services.mpd = {
    enable = true;

    musicDirectory = "${config.home.homeDirectory}/Music";

    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  };
  services.mpd-mpris = {
    enable = true;
  };

  programs.ncmpcpp = {
    enable = true;

    mpdMusicDir = "${config.home.homeDirectory}/Music";

    settings = {
      mpd_host = "127.0.0.1";
      mpd_port = 6600;
    };
  };
}
