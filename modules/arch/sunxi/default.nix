{ pkgs, lib, config, ... }: {
  imports = [
    ../../overlays.nix
    ./cache.nix
  ];
  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
    consoleLogLevel = lib.mkDefault 7;
    kernelParams = [
      # Needs for debug boot
      "earlycon"
      # Needs to bind UART console
      "console=ttyS0,115200n8"
    ];
    initrd = {
      availableKernelModules = [
        # Needs to mount rootfs from SD Card
        "sunxi-mmc"
      ];
    };
  };
}
