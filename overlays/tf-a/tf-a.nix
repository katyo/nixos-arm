{ lib, stdenv, fetchFromGitHub, openssl, pkgsCross, buildPackages

# Warning: this blob (hdcp.bin) runs on the main CPU (not the GPU) at
# privilege level EL3, which is above both the kernel and the
# hypervisor.
#
# This parameter applies only to platforms which are believed to use
# hdcp.bin. On all other platforms, or if unfreeIncludeHDCPBlob=false,
# hdcp.bin will be deleted before building.
, unfreeIncludeHDCPBlob ? true
}:

{ filesToInstall
, installDir ? "$out"
, platform ? null
, platformCanUseHDCPBlob ? false  # set this to true if the platform is able to use hdcp.bin
, extraPatches ? []
, extraMakeFlags ? []
, extraMeta ? {}
, ... } @ args:

# delete hdcp.bin if either: the platform is thought to
# not need it or unfreeIncludeHDCPBlob is false
let deleteHDCPBlobBeforeBuild = !platformCanUseHDCPBlob || !unfreeIncludeHDCPBlob;

in stdenv.mkDerivation (rec {
    pname = "arm-trusted-firmware${lib.optionalString (platform != null) "-${platform}"}";
    version = "2.8";

    src = fetchFromGitHub {
      owner = "ARM-software";
      repo = "arm-trusted-firmware";
      rev = "v${version}";
      hash = "sha256-435bZ0aVEt8D4SqDgtUr4Xv42padcmglZbCn2J8bOD8=";
    };

    patches = lib.optionals deleteHDCPBlobBeforeBuild [
      # this is a rebased version of https://gitlab.com/vicencb/kevinboot/-/blob/master/atf.patch
      ./patches/remove-hdcp-blob.patch
    ];

    postPatch = lib.optionalString deleteHDCPBlobBeforeBuild ''
      rm plat/rockchip/rk3399/drivers/dp/hdcp.bin
    '';

    depsBuildBuild = [ buildPackages.stdenv.cc ];

    # For Cortex-M0 firmware in RK3399
    nativeBuildInputs = [ pkgsCross.arm-embedded.stdenv.cc ];

    buildInputs = [ openssl ];

    makeFlags = [
      "CROSS_COMPILE=${stdenv.cc.targetPrefix}"
      "LDFLAGS=-no-warn-rwx-segments"
    ] ++ (lib.optional (platform != null) "PLAT=${platform}")
      ++ extraMakeFlags;

    installPhase = ''
      runHook preInstall
      mkdir -p ${installDir}
      cp ${lib.concatStringsSep " " filesToInstall} ${installDir}
      runHook postInstall
    '';

    hardeningDisable = [ "all" ];
    dontStrip = true;

    # Fatal error: can't create build/sun50iw1p1/release/bl31/sunxi_clocks.o: No such file or directory
    enableParallelBuilding = false;

    meta = with lib; {
      homepage = "https://github.com/ARM-software/arm-trusted-firmware";
      description = "A reference implementation of secure world software for ARMv8-A";
      license = [ licenses.bsd3 ] ++ lib.optionals (!deleteHDCPBlobBeforeBuild) [ licenses.unfreeRedistributable ];
      maintainers = with maintainers; [ lopsided98 ];
    } // extraMeta;
  } // builtins.removeAttrs args [ "extraMeta" ])
