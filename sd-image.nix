{ pkgs, lib, config, ... }: {
  imports = [
    ./modules/sd-image-orangepi-zero2.nix
  ];

  sdImage = {
    compressImageMethod = "xz";
    compressImageLevel = 9;
  };

  users.extraUsers.root = {
    initialPassword = "orangepi";
    openssh.authorizedKeys.keys = [
      # "ssh-ed25519 AAAAC3NzaC1lZDI1.... username@tld"
    ];
  };
}
