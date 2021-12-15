{ pkgs, lib, ... }:
let
  overlaysRoot = ../overlays;
  importOverlay = name: value: import (overlaysRoot + ("/" + name));
  filterOverlay = name: value: (value == "regular" && (lib.hasSuffix ".nix" name) && name != "default.nix") ||
                               (value == "directory" && !(lib.hasSuffix "~" name) &&
                                builtins.pathExists (overlaysRoot + ("/" + name + "/default.nix")));
  overlays = lib.mapAttrsToList importOverlay (lib.filterAttrs filterOverlay (builtins.readDir overlaysRoot));
in {
  nixpkgs.overlays = overlays;
}
