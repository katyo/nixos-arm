{ pkgs, lib, config, ... }: {
  imports = [
    ../../arch/sunxi/sd-image.nix
    ../../installer-ssh.nix
    ./.
  ];

  sdImage = {
    imageBaseName = "orangepi-3-lts";
    ubootPackage = pkgs.ubootOrangePi3LTSCrust;
  };
}
