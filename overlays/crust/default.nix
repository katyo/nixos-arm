self: super:
let pkgs = self;

    buildCrustScpFirmware = pkgs.callPackage ./crust.nix {};
in {
  crustScpFirmwareOrangePi3 = buildCrustScpFirmware {
    defconfig = "orangepi_3_defconfig";
    #extraMeta.platforms = [ "or1k-linux" ];
  };
}
