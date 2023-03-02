{ stdenv
, lib
, bc
, bison
, dtc
, fetchFromGitHub
, fetchpatch
, fetchurl
, flex
, gnutls
, libuuid
, meson-tools
, ncurses
, openssl
, swig
, which
, buildPackages
}:

let
  defaultVersion = "2023.01";
  defaultSrc = fetchurl {
    url = "ftp://ftp.denx.de/pub/u-boot/u-boot-${defaultVersion}.tar.bz2";
    hash = "sha256-aUI7rTgPiaCRZjbonm3L0uRRLVhDCNki0QOdHkMxlQ8=";
  };

in lib.makeOverridable ({
    version ? null
  , src ? null
  , filesToInstall
  , installDir ? "$out"
  , defconfig
  , extraConfig ? ""
  , extraPatches ? []
  , extraMakeFlags ? []
  , extraMeta ? {}
  , ... } @ args: stdenv.mkDerivation ({
    pname = "uboot-${defconfig}";

    version = if src == null then defaultVersion else version;

    src = if src == null then defaultSrc else src;

    patches = [
      #./patches/0001-configs-rpi-allow-for-bigger-kernels.patch

      # Make U-Boot forward some important settings from the firmware-provided FDT. Fixes booting on BCM2711C0 boards.
      # See also: https://github.com/NixOS/nixpkgs/issues/135828
      # Source: https://patchwork.ozlabs.org/project/uboot/patch/20210822143656.289891-1-sjoerd@collabora.com/
      #./patches/0001-rpi-Copy-properties-from-firmware-dtb-to-the-loaded-.patch
    ] ++ extraPatches;

    postPatch = ''
      patchShebangs tools
      patchShebangs arch/arm/mach-rockchip
    '';

    nativeBuildInputs = [
      ncurses # tools/kwboot
      bc
      bison
      dtc
      flex
      openssl
      (buildPackages.python3.withPackages (p: [
        p.libfdt
        p.setuptools # for pkg_resources
      ]))
      swig
      which # for scripts/dtc-version.sh
    ];
    depsBuildBuild = [ buildPackages.stdenv.cc ];

    buildInputs = [
      ncurses # tools/kwboot
      libuuid # tools/mkeficapsule
      gnutls # tools/mkeficapsule
    ];

    hardeningDisable = [ "all" ];

    enableParallelBuilding = true;

    makeFlags = [
      "DTC=dtc"
      "CROSS_COMPILE=${stdenv.cc.targetPrefix}"
    ] ++ extraMakeFlags;

    passAsFile = [ "extraConfig" ];

    configurePhase = ''
      runHook preConfigure
      make ${defconfig}
      cat $extraConfigPath >> .config
      runHook postConfigure
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p ${installDir}
      cp ${lib.concatStringsSep " " filesToInstall} ${installDir}
      mkdir -p "$out/nix-support"
      ${lib.concatMapStrings (file: ''
        echo "file binary-dist ${installDir}/${builtins.baseNameOf file}" >> "$out/nix-support/hydra-build-products"
      '') filesToInstall}
      runHook postInstall
    '';

    dontStrip = true;

    meta = with lib; {
      homepage = "http://www.denx.de/wiki/U-Boot/";
      description = "Boot loader for embedded systems";
      license = licenses.gpl2;
      maintainers = with maintainers; [ bartsch dezgeg samueldr lopsided98 ];
    } // extraMeta;
  } // removeAttrs args [ "extraMeta" ]))
