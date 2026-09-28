{
  lib,
  pkgs,
  ...
}:
{
  systemd.user.services.insa-ros2-env-provision = {
    description = "Provision https://github.com/clementPene/INSA_ros2_env";
    script = ''
      if [[ -d "$HOME/INSA_ros2_env" ]]; then
        ${lib.getExe pkgs.git} -C "$HOME/INSA_ros2_env" fetch
      else
        ${lib.getExe pkgs.git} -C "$HOME" clone https://github.com/clementPene/INSA_ros2_env
      fi
      cd "$HOME/INSA_ros2_env"
      ${lib.getExe pkgs.nix} build
      ${lib.getExe pkgs.direnv} allow
    '';
    unitConfig = {
      ConditionUser = "user";
      StartLimitIntervalSec = "5min";
      StartLimitBurst = 5;
    };
    serviceConfig = {
      Restart = "on-failure";
      RestartSec = "5s";
    };
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "default.target" ];
  };
}
