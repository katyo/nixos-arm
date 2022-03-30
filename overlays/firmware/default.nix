self: super:
let pkgs = self;
in {
  uwe5622-firmware = pkgs.callPackage ./uwe5622.nix {};
}
