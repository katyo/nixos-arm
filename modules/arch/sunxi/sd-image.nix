{ pkgs, lib, config, ... }: {
  imports = [
    <nixpkgs/nixos/modules/profiles/base.nix>
    ../../sd-image.nix
  ];

  sdImage = {
    imageBaseName = "nixos-sd-image-sunxi64-";
    partitionsOffset = 4;
    ubootBinary = "u-boot-sunxi-with-spl.bin";
    firmwarePartition = false;
    populateRootCommands = ''
      mkdir -p ./files/boot
      ${config.boot.loader.generic-extlinux-compatible.populateCmd} -c ${config.system.build.toplevel} -d ./files/boot
    '';
  };
}
