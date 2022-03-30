{ lib, stdenvNoCC, fetchurl }:
let fetch = file: hash: fetchurl {
  url = "https://github.com/orangepi-xunlong/firmware/raw/master/${file}";
  sha256 = hash;
};
in stdenvNoCC.mkDerivation rec {
  pname = "uwe5622-firmware";
  version = "1.0";

  src = [
    (fetch "wcnmodem.bin" "1bfcv56b7k04rf34dg9z25rsi8b4rilwqm525mbg7iq1ssnygn2d")
    (fetch "wifi_2355b001_1ant.ini" "1xrqx72fymhrrixzpkl0mc451pfnjxjp08qwmnchp3as4kn40g0z")
    (fetch "bt_configure_pskey.ini" "1b6hg946myr5qc5rb5fndigy8yn63nhj8jqx0c0n54b8zmiiyyjs")
    (fetch "bt_configure_rf.ini" "0zb17l0qv5l2wwiikfi1667lmxq79lpw9m319f40xypxmqmjai20")
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
