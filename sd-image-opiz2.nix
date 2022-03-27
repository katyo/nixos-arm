{ pkgs, lib, config, ... }: {
  imports = [
    ./modules/board/orangepi-zero2/sd-image.nix
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
