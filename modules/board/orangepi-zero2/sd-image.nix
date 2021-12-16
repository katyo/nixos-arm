{ pkgs, lib, config, ... }: {
  imports = [
    ../../arch/sunxi/sd-image.nix
    ./.
  ];

  sdImage = {
    imageBaseName = "nixos-sd-image-orangepi-zero2";
    postBuildCommands = ''
      dd if=${pkgs.ubootOrangePiZero2}/u-boot-sunxi-with-spl.bin of=$img bs=1024 seek=8 conv=notrunc
    '';
  };
}
