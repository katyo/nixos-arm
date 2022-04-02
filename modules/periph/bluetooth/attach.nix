{ config, lib, pkgs, ... }:
let
  cfg = config.hardware.bluetooth;
  pkg = cfg.package;

  instanceOptions = with lib; with types; { config, ... }: {
    options = {
      enable = mkEnableOption "Enable bluetooth attach";
      method = mkOption {
        type = enum ["hciattach" "brcm_patchram_plus"];
        description = "Attaching method.";
      };
      params = mkOption {
        type = listOf (oneOf [nonEmptyStr int float]);
      };
    };
  };
in {
  ###### interface

  options = with lib; with types; {
    hardware.bluetooth.attach = mkOption {
      type = attrsOf (submodule instanceOptions);
      default = {};
      description = "Attach bluetooth periphery.";
    };
  };

  ###### implementation

  config = with lib; mkIf cfg.enable {
    systemd.services = mapAttrs' (name: config: nameValuePair "bluetooth-${name}" {
      description = "Bluetooth attach (${name})";
      after = ["bluetooth.service"];
      #requires = ["bluetooth.service"];
      wantedBy = ["bluetooth.target"];
      serviceConfig = {
        Type = "forking";
        ExecStartPre = "${pkgs.util-linux}/bin/rfkill unblock all";
        ExecStart = (if config.method == "hciattach" then "${cfg.package}/bin/hciattach " else "") +
          (concatMapStringsSep " " (param: toString param) config.params);
        TimeoutSec = 0;
        RemainAfterExit = "yes";
      };
    }) (filterAttrs (name: config: config.enable) cfg.attach);
  };
}
