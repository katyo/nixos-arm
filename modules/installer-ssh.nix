{ pkgs, lib, config, ... }: {
  users.extraUsers.root = {
    initialPassword = "nixospi";
  };

  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
  };
}
