self: super:
let pkgs = self;
    makeToolchain = pkgs.callPackage ./gcc-bootlin-toolchain {};
in {
  gcc-openrisc-linux-musl = makeToolchain {
    arch = "openrisc";
    libc = "musl";
    tag = "bleeding-edge";
    version = "2022.08-1";
    #hash = "sha256-ubRciczmgrE0Pjc09MLa7/JjOAbxouopyGGVYGDs4Wo=";
    hash = "sha256-ViWC2otaOGYkp8GMvgUR+PS+0gby3nAJ5mt1IU9W3TI=";
  };
}
