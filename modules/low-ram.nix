{ lib, ... }:
with lib;
{
  zramSwap = {
    enable = mkDefault true;
    memoryPercent = mkDefault 40; # 40%
  };
}
