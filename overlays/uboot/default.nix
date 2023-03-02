self: super:
let pkgs = self;

    buildUBoot = pkgs.callPackage ./u-boot.nix {};
in {
  ubootOrangePi3LTS = buildUBoot {
    defconfig = "orangepi_3_lts_defconfig";
    extraMeta.platforms = [ "aarch64-linux" ];
    extraMakeFlags = [
      "BL31=${pkgs.armTrustedFirmwareAllwinnerH6}/bl31.bin"
    ];
    filesToInstall = [ "u-boot-sunxi-with-spl.bin" ];
    extraPatches = [
      ./patches/0003-add-orange-pi-3-lts-support.patch
    ];
  };

  ubootOrangePi3LTSCrust = buildUBoot {
    defconfig = "orangepi_3_lts_defconfig";
    extraMeta.platforms = [ "aarch64-linux" ];
    extraMakeFlags = [
      "BL31=${pkgs.armTrustedFirmwareAllwinnerH6}/bl31.bin"
      "SCP=${pkgs.crustScpFirmwareOrangePi3}/scp.bin"
    ];
    filesToInstall = [ "u-boot-sunxi-with-spl.bin" ];
    extraPatches = [
      ./patches/0003-add-orange-pi-3-lts-support.patch
    ];
  };

  ubootOrangePiZero2 = buildUBoot {
    defconfig = "orangepi_zero2_defconfig";
    extraMeta.platforms = [ "aarch64-linux" ];
    extraMakeFlags = [
      "BL31=${pkgs.armTrustedFirmwareAllwinnerH616}/bl31.bin"
    ];
    filesToInstall = [ "u-boot-sunxi-with-spl.bin" ];
    extraPatches = [
      ./patches/0001-Adding-h616-THS-workaround.patch
      ./patches/0002-sunxi-H616-GPU-enable-hack.patch
    ];
  };
}
