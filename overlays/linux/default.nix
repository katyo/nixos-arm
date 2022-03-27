self: super:
let pkgs = self;
    lib = pkgs.lib;
in {
  linux_5_15 = pkgs.callPackage ./linux-5.15.nix {
    kernelPatches = with pkgs.kernelPatches; [
      bridge_stp_helper
      request_key_helper
    ];
  };
  linux_5_17 = pkgs.callPackage ./linux-5.17.nix {
    kernelPatches = with pkgs.kernelPatches; [
      bridge_stp_helper
      request_key_helper
    ];
  };
  linuxPackages_h616 = (pkgs.callPackage ./sun50i-h616 {}).extend (self: super: {
    zfs = super.stdenv;
  });
}
