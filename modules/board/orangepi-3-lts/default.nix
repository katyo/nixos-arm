{ lib, pkgs, ... }: {
  imports = [
    ../../arch/sunxi
    ../../periph/bluetooth
    ../../low-ram.nix
  ];
  boot = {
    kernelModules = [
      "sprdwl_ng" # onboard wifi
      "sprdbt_tty" # onboard bluetooth
    ];
    blacklistedKernelModules = [
      #"panfrost"
    ];
    kernelPackages = pkgs.linuxPackages_sun50i;
  };
  hardware = {
    firmware = with pkgs; [
      uwe5622-firmware
    ];
    bluetooth = with lib; {
      enable = mkDefault true;
      package = pkgs.bluez_opi;
      attach.uwe5622.enable = mkDefault true;
    };
  };
}
