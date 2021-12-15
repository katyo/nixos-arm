{ pkgs, lib, config, ... }: {
  imports = [
    ./sd-image-sunxi.nix
  ];

  boot = {
    blacklistedKernelModules = [
      "panfrost"
    ];
    kernelPackages = pkgs.linuxPackages_h616;
  };
}
