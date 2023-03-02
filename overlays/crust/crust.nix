{ lib, stdenv, fetchFromGitHub, pkgsCross, flex, bison, swig, buildPackages }:

{ filesToInstall ? [ "build/scp/scp.bin" ]
, installDir ? "$out"
, defconfig
, extraConfig ? ""
, extraPatches ? []
, extraMakeFlags ? []
, extraMeta ? {}
, ... } @ args:

stdenv.mkDerivation (rec {
    pname = "crust-scp-${defconfig}";
    version = "0.5-03acc41";

    src = fetchFromGitHub {
      owner = "crust-firmware";
      repo = "crust";
      #rev = "v${version}";
      rev = "03acc41";
      hash = "sha256-ubRciczmgrE0Pjc09MLa7/JjOAbxouopyGGVYGDs4Wo=";
    };

    depsBuildBuild = [ buildPackages.stdenv.cc ];

    nativeBuildInputs = [ flex bison swig pkgsCross.or1k.stdenv.cc ];

    patches = [
      ./patches/0001-fix-build-with-gcc12.patch
    ] ++ extraPatches;

    passAsFile = [ "extraConfig" ];

    configurePhase = ''
      runHook preConfigure
      make ${defconfig}
      cat $extraConfigPath >> .config
      runHook postConfigure
    '';

    makeFlags = [
      "HOST_COMPILE="
      "CROSS_COMPILE=or1k-elf-"
    ] ++ extraMakeFlags;

    installPhase = ''
      runHook preInstall
      mkdir -p ${installDir}
      cp ${lib.concatStringsSep " " filesToInstall} ${installDir}
      runHook postInstall
    '';

    hardeningDisable = [ "all" ];
    dontStrip = true;

    enableParallelBuilding = true;

    meta = with lib; {
      homepage = "https://github.com/crust-firmware/crust";
      description = "SCP (power management) firmware for sunxi SoCs";
      license = [ licenses.bsd3 licenses.gpl2 licenses.mit ];
      maintainers = with maintainers; [ ];
    } // extraMeta;
  } // builtins.removeAttrs args [ "extraMeta" ])
