{ pkgs, lib, config, ... }: {
  imports = [
    ../../arch/sunxi/sd-image.nix
    ./.
  ];

  sdImage = {
    postBuildCommands = ''
      dd if=${pkgs.ubootOrangePiZero2}/u-boot-sunxi-with-spl.bin of=$img bs=1024 seek=8 conv=notrunc
    '';
    imageBaseName = "orangepi-zero2";
  };
}
