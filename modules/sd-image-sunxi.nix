{ pkgs, lib, config, ... }: {
  imports = [
    <nixpkgs/nixos/modules/profiles/base.nix>
    ./sd-image.nix
  ];

  nixpkgs.overlays = [
    (import ../overlays/tf-a)
    (import ../overlays/uboot)
    (import ../overlays/linux)
  ];

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
    consoleLogLevel = lib.mkDefault 7;
    kernelParams = [
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

  sdImage = {
    imageBaseName = "nixos-sd-image-sunxi64";
    partitionsOffset = 4;
    firmwarePartition = false;
    populateRootCommands = ''
      mkdir -p ./files/boot
      ${config.boot.loader.generic-extlinux-compatible.populateCmd} -c ${config.system.build.toplevel} -d ./files/boot
    '';
    postBuildCommands = ''
      dd if=${pkgs.ubootOrangePiZero2}/u-boot-sunxi-with-spl.bin of=$img bs=1024 seek=8 conv=notrunc
    '';
  };
}
