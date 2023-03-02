{ config, lib, pkgs, ... }:
let
  cfg = config.hardware.bluetooth;
  pkg = cfg.package;

  instanceOptions = with lib; with types; { config, ... }: {
    options = {
      enable = mkEnableOption "Enable attach";
      name = mkOption {
        type = nullOr str;
        default = null;
        description = "Adapter name.";
      };
      device = mkOption {
        type = str;
        default = "/dev/ttyBT0";
        description = "Device path.";
      };
      typeId = mkOption {
        type = enum ["any" "ericsson" "digi" "bcsp" "xircom" "csr"
                     "bboxes" "swave" "texas" "texasalt" "st"
                     "stlc2500" "philips" "bgb2xx" "picocard"
                     "inventel" "comone" "tdk" "socket" "3com"
                     "bt2000c" "zoom" "sitecom" "billionton"
                     "bcm2035" "bcm43xx" "ath3k" "qualcomm" "intel"
                     "3wire" "amp" "sprd" "xradio" "rtk_h4" "rtk_h5"];
        description = ''
          The type or id of the Bluetooth device that is to be attached,
          i.e. vendor or other device specific identifier.
        '';
      };
      speed = mkOption {
        type = nullOr ints.positive;
        default = null;
        description = ''
          The speed specifies the UART speed to use.
          Baudrates higher than 115200bps require vendor specific
          initializations that are not implemented for all types
          of devices.
        '';
      };
      sendBreak = mkOption {
        types = bool;
        default = false;
        description = "Send break.";
      };
      initialSpeed = mkOption {
        type = nullOr ints.positive;
        default = null;
        description = "Specify an initial speed instead of the hardware default.";
      };
      initializationTimeout = mkOption {
        type = nullOf ints.positive;
        default = null;
        description = "Specify an initialization timeout. Default is 5 seconds.";
      };
    };
  };
in {
  ###### interface

  options = with lib; with types; {
    hardware.bluetooth.hciattach = mkOption {
      type = attrsOf (submodule instanceOptions);
      default = {};
      description = ''
        Instances of hciattach service.

        hciattach - attach serial devices via UART HCI to BlueZ stack
      '';
    };
  };

  ###### implementation

  config = with lib; mkIf cfg.enable {
    systemd.services = mapAttrs (name: config: {
      description = "Bluetooth ${name}" +
        (optionalString (config.name != null) " (${config.name})");
      after = ["bluetooth.service"];
      #requires = ["bluetooth.service"];
      wantedBy = ["bluetooth.target"];
      serviceConfig = {
        Type = "forking";
        ExecStartPre = "${pkgs.util-linux}/bin/rfkill unblock all";
        ExecStart = "${cfg.package}/bin/hciattach " +
          (optionalString config.sendBreak " -i") +
          (optionalString (config.initialSpeed != null) " -s ${toString config.initialSpeed}") +
          " ${config.device} ${config.typeId}" +
          (optionalString (config.speed != null) " ${toString config.speed}");
        TimeoutSec = 0;
        RemainAfterExit = "yes";
        SysVStartPriority = 99;
      };
    }) (filterAttrs (name: config: config.enable) cfg.hciattach);
  };
}

{
  hardware.bluetooth.hciattach.sprd = {
    enable = true;
    name = "UWE5622";
    typeId = "sprd";
    initialSpeed = 1500000;
  };
}
