# WIP Nixos images for Xunlong OrangePi Boards

Work-in-progress SD card images for Xunlong OrangePi Zero2 and possibly other sunxi64 boards.

This project was started from scratch as a hobby.
I adapted patches for linux kernel integrated into armbian.
I integrated patches from Xunlong linux kernel and Debian/Ubuntu images.

## Improvements

1. Partially reworked sd-image generation module
  - Firmware (vfat) partition which is used on UEFI enabled boards like Raspberry Pi now is optional
  - Added support for different image compression methods (zstd, xz, lzma)
  - Added support for custom compression levels (0-9)

2. Fixed board packages
  - Enabled debug in ARM Trusted Firmware
  - Added patches for uboot

3. Fixed linux kernel
  - Added multiple patches
  - Added custom configuration

## Get working

- Onboard Wifi
- Onboard Bluetooth
- Onboard Sound Codec
- Panfrost
