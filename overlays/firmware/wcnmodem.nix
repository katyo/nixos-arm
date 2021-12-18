{ lib, stdenvNoCC, fetchurl }:
stdenvNoCC.mkDerivation rec {
  pname = "wcnmodem-firmware";
  version = "1.0";

  src = [
    (fetchurl {
      url = "https://github.com/armbian/firmware/raw/master/wcnmodem.bin";
      sha256 = "1bfcv56b7k04rf34dg9z25rsi8b4rilwqm525mbg7iq1ssnygn2d";
    })
    (fetchurl {
      url = "https://github.com/armbian/firmware/raw/master/wifi_2355b001_1ant.ini";
      sha256 = "1xrqx72fymhrrixzpkl0mc451pfnjxjp08qwmnchp3as4kn40g0z";
    })
  ];

  unpackPhase = "true";
  dontFixup = true; # binaries must not be stripped or patchelfed

  installPhase = ''
    runHook preInstall
    mkdir -p $out/lib/firmware/
    for s in $src; do
      cp ''$s $out/lib/firmware/''${s/*-/}
    done
    runHook postInstall
  '';
}
