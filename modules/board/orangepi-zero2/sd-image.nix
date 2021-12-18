{ pkgs, lib, config, ... }: {
  imports = [
    ../../arch/sunxi/sd-image.nix
    ./.
  ];

  sdImage = {
    imageBaseName = "orangepi-zero2";
    ubootPackage = pkgs.ubootOrangePiZero2;
  };
}
