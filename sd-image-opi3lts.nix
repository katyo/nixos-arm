{ pkgs, lib, config, ... }: {
  imports = [
    ./modules/board/orangepi-3-lts/sd-image.nix
  ];

  sdImage = {
    compressImageMethod = "xz";
    compressImageLevel = 9;
  };

  users.extraUsers.root = {
    # You can configure root password for installer:
    # initialPassword = "orangepi";

    # Also you can add your authorized ssh keys:
    openssh.authorizedKeys.keys = [
      # "ssh-ed25519 AAAAC3NzaC1lZDI1.... username@tld"
    ];
  };
  boot.supportedFilesystems = lib.mkForce [ "btrfs" "cifs" "f2fs" "jfs" "ntfs" "reiserfs" "vfat" "xfs" ];
}
