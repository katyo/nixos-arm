self: super:
let pkgs = self;
    lib = pkgs.lib;

    debugBuild = true;
    debugFlag = lib.optionalString debugBuild "DEBUG=1";
    bl31Path = platform: "build/${platform}/${if debugBuild then "debug" else "release"}/bl31.bin";

    buildArmTrustedFirmware = pkgs.callPackage ./tf-a.nix {};
in {
  armTrustedFirmwareAllwinnerH6 = buildArmTrustedFirmware rec {
    platform = "sun50i_h6";
    extraMeta.platforms = [ "aarch64-linux" ];
    extraMakeFlags = [ debugFlag "SUNXI_SETUP_REGULATORS=0" ];
    filesToInstall = [ (bl31Path platform) ];
    extraPatches = [
      ./patches/0001-Fix-reset-issue-on-H6-by-using-R_WDOG.patch
      ./patches/0002-Quick-fix-for-bl31.elf-has-a-LOAD-segment-with-RWX-p.patch
    ];
  };

  /*armTrustedFirmwareAllwinnerH6Crust = buildArmTrustedFirmware rec {
    platform = "sun50i_h6";
    extraMeta.platforms = [ "aarch64-linux" ];
    extraMakeFlags = [ debugFlag ];
    filesToInstall = [ (bl31Path platform) ];
    extraPatches = [
      ./patches/0001-Fix-reset-issue-on-H6-by-using-R_WDOG.patch
      ./patches/0002-Quick-fix-for-bl31.elf-has-a-LOAD-segment-with-RWX-p.patch
    ];
  };*/

  armTrustedFirmwareAllwinnerH616 = buildArmTrustedFirmware rec {
    platform = "sun50i_h616";
    extraMeta.platforms = [ "aarch64-linux" ];
    extraMakeFlags = [ debugFlag ];
    filesToInstall = [ (bl31Path platform) ];
    extraPatches = [
      ./patches/0002-Quick-fix-for-bl31.elf-has-a-LOAD-segment-with-RWX-p.patch
    ];
  };
}
