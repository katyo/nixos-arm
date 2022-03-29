{ pkgs, lib, config, ... }: {
  imports = [
    ../../arch/sunxi
  ];
  boot = {
    kernelModules = [
      "sprdwl_ng" # onboard wifi
    ];
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
