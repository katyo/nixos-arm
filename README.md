# WIP Nixos images for ARM-base SBCs

Work-in-progress SD card images for ARM-based boards.
This project was started from scratch as a hobby.
I adapted patches for linux kernel integrated into armbian.

## Xunlong boards

I integrated patches from Xunlong linux kernel and Debian/Ubuntu images.

Related repos:

- [U-Boot](https://github.com/katyo/u-boot/tree/opiz2)
- [Linux](https://github.com/katyo/linux/tree/kayo-h616-5.17.y)
- [Bluez](https://github.com/katyo/bluez/tree/orangepi)

### OrangePi Zero2

1. Partially reworked sd-image generation module
  - Firmware (vfat) partition which is used on UEFI enabled boards like Raspberry Pi now is optional
  - Added support for different image compression methods (zstd, xz, lzma)
  - Added support for custom compression levels (0-9)

2. ARM Trusted Firmware modifications:
  - Enabled debug

3. U-Boot modifications:
  - Added workaround to enable THS temperature sensors
  - Added workaround to enable GPU to get panfrost working

3. Linux kernel modifications:
  - Added board device-tree for OrangePi Zero2
  - Added themperature sensor dtiver
  - Added onboard ethernet phy support
  - Added Unisoc UWE5622 wifi/bluetooth drivers:
    - [x] Wifi
    - [ ] Bluetooth
  - Added Cedrus hardware accelerated video codec support (not tested)
  - Added HDMI support fixes
    - [x] 3D rendering via panfrost tested using kmscube
  - Added Sound codec support (not tested)
  - Added fixes for RTC driver
  - Added custom configuration

## Installation

1. Download unpack and write SD image to compatible SD-card
2. Insert SD-card and supply power onto the board
3. When system is started connect via ssh or serial port. (user: root, password: nixospi)
4. Run `nixos-generate-config` to get initial configuration in `/etc/nixos`
5. Edit `/etc/nixos/configuration.nix` manually (add users, enable services, system packages and etc.)
6. Run `nix-channel --update` and `nixos-rebuild switch` to finish installation
7. Reboot
