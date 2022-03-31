self: super:
let override = false;
    bluez = (self.callPackage ./bluez.nix {}).overrideDerivation (attrs: {
      patches = [
        ./patches/0001-orangepi-Added-SPRD-UWE5622-radio-support.patch
        ./patches/0002-orangepi-Added-XRadio-XR829-radio-support.patch
        ./patches/0003-orangepi-Added-Realtek-H4-H5-radio-support.patch
        ./patches/0004-orangepi-Fixed-MAC-address-setting-for-uwe5622.patch
      ];
      postPatch = attrs.postPatch + ''
        find tools -type f -name 'hciattach_*.c' | while read c; do
          echo "Fix firmware paths in ''$c"
          substituteInPlace ''$c \
            --replace /lib/firmware /run/current-system/firmware
        done
      '';
    });
in if override then {
  inherit bluez;
  bluez5 = bluez;
  bluezFull = bluez;
} else {
  bluez_opi = bluez;
}
