self: super:
let pkgs = self;
in {
  ubootOrangePiZero2 = pkgs.buildUBoot {
    defconfig = "orangepi_zero2_defconfig";
    extraMeta.platforms = [ "aarch64-linux" ];
    BL31 = "${pkgs.armTrustedFirmwareAllwinnerH616}/bl31.bin";
    filesToInstall = [ "u-boot-sunxi-with-spl.bin" ];
    extraPatches = [
      ./patches/add-h616-THS-workaround.patch
    ];
  };
}
