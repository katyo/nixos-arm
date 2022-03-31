{ pkgs, lib, config, ... }: {
  imports = [
    ../../arch/sunxi
  ];
  boot = {
    kernelModules = [
      "sprdwl_ng" # onboard wifi
      "sprdbt_tty" # onboard bluetooth
    ];
    blacklistedKernelModules = [
      #"panfrost"
    ];
    kernelPackages = pkgs.linuxPackages_h616;
  };
  hardware = {
    firmware = with pkgs; [
      uwe5622-firmware
    ];
  };
}
