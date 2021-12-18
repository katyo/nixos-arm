{ pkgs, lib, config, ... }: {
  imports = [
    ../../arch/sunxi
  ];
  boot = {
    blacklistedKernelModules = [
      #"panfrost"
    ];
    kernelPackages = pkgs.linuxPackages_h616;
  };
  hardware = {
    firmware = with pkgs; [
      wcnmodem-firmware
    ];
  };
}
