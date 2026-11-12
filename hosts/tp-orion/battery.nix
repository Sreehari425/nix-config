{
  systemd.services.set-battery-threshold = {
    description = "Set ThinkPad battery charge thresholds";

    wantedBy = [ "multi-user.target" ];
    after = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };

    script = ''
      echo 70 > /sys/class/power_supply/BAT0/charge_start_threshold
      echo 85 > /sys/class/power_supply/BAT0/charge_stop_threshold
    '';
  };
}
