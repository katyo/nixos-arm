{ stdenv, fetchurl, file }:

{ arch, libc ? "musl", tag ? "bleeding-edge", version, hash, ... }:

let urlBase = "https://toolchains.bootlin.com/downloads/releases/toolchains";

in stdenv.mkDerivation {
  pname = "gcc-or1k-linux-musl";
  inherit version;

  src = fetchurl {
    url = "${urlBase}/${arch}/tarballs/${arch}--${libc}--${tag}-${version}.tar.bz2";
    inherit hash;
  };

  nativeBuildInputs = [ file ];

  buildPhase = "true";
  installPhase = ''
    runHook preInstall
    cp -r . $out
    cd $out && sh relocate-sdk.sh
    runHook postInstall
  '';
}
