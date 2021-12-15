self: super:
let pkgs = self;
    lib = pkgs.lib;
    debugBuild = true;
in {
  armTrustedFirmwareAllwinnerH616 = pkgs.buildArmTrustedFirmware rec {
    platform = "sun50i_h616";
    extraMeta.platforms = [ "aarch64-linux" ];
    extraMakeFlags = [ (lib.optionalString debugBuild "DEBUG=1") ];
    filesToInstall = [ "build/${platform}/${if debugBuild then "debug" else "release"}/bl31.bin" ];
  };
}
