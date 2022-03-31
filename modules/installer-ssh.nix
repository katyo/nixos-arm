{ lib, ... }:
with lib;
{
  users.extraUsers.root = {
    initialPassword = mkDefault "nixospi";
  };

  services.openssh = {
    enable = mkDefault true;
    permitRootLogin = mkDefault "yes";
  };
}
