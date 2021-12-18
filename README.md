# WIP Nixos images for Xunlong OrangePi Boards

Work-in-progress SD card images for Xunlong OrangePi Zero2 and possibly other sunxi64 boards.

This project was started from scratch as a hobby.
I adapted patches for linux kernel integrated into armbian.
I integrated patches from Xunlong linux kernel and Debian/Ubuntu images.

Related repos:

- [U-Boot](https://github.com/katyo/u-boot/tree/opiz2)
- [Linux kernel](https://github.com/katyo/linux/tree/kayo-h616-5.15.y)

## Improvements

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
  - Added Unisoc UWE5622 wifi/bluetooth drivers
  - Added Cedrus hardware accelerated video codec support
  - Added HDMI support fixes
  - Added Sound codec support
  - Added fixes for RTC driver
  - Added custom configuration

## Need to be done

- Onboard Wifi
- Onboard Bluetooth
- Onboard Sound Codec
