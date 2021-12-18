self: super:
let pkgs = self;
in {
  wcnmodem-firmware = pkgs.callPackage ./wcnmodem.nix {};
}
