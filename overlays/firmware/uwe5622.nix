{ lib, stdenvNoCC, fetchurl }:
let fetch = file: hash: fetchurl {
  url = "https://github.com/orangepi-xunlong/firmware/raw/master/${file}";
  inherit hash;
};
in stdenvNoCC.mkDerivation rec {
  pname = "uwe5622-firmware";
  version = "1.0";

  src = [
    (fetch "wcnmodem.bin" "sha256-EZuHzjCHVzSmdGL3KT+4/oWs8ycP6LeMl4riS+dxWoA=")
    (fetch "wifi_2355b001_1ant.ini" "sha256-HzxA7CRajQuZrRwjcGWX1t1QCKuAzvt7zBlW78TpOPc=")
    (fetch "bt_configure_pskey.ini" "sha256-WnofY/1okWIBAx1LJKEdxnrkX2zWlZULwyX7akh60Kw=")
    (fetch "bt_configure_rf.ini" "sha256-QEQlK679+g6IS2HUxC9NB/dKjzEhuhkj54KWjQE9YX0=")
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
