{ pkgs, lib }:
let linux = pkgs.linux_5_15.override {
      structuredExtraConfig = with lib.kernel; {
        ARCH_SUNXI = yes;
        HIBERNATION = no;
        SUSPEND_FREEZER = yes;
        ARCH_HIBERNATION_POSSIBLE = yes;
        ARCH_SUSPEND_POSSIBLE = yes;
        ENERGY_MODEL = yes;
        WQ_POWER_EFFICIENT_DEFAULT = yes;
        ARM_CPUIDLE = yes;
        ARM_PSCI_CPUIDLE = yes;
        ARM_SCPI_CPUFREQ = module;
        ARM_SCMI_CPUFREQ = module;
        ARM_FFA_TRANSPORT = yes;

        ARCH_ENABLE_HUGEPAGE_MIGRATION = yes;
        ARCH_HAS_FILTER_PGPROT = yes;
        ARCH_HAS_RESET_CONTROLLER = yes;
        ARCH_INTEL_SOCFPGA = no;
        ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE = yes;
        ARCH_SUPPORTS_CFI_CLANG = yes;
        ARCH_SUPPORTS_HUGETLBFS = yes;
        ARCH_SUPPORTS_LTO_CLANG = yes;
        ARCH_SUPPORTS_LTO_CLANG_THIN = yes;
        ARCH_USE_MEMTEST = yes;
        ARM64_EPAN = yes;
        ARM64_LD_HAS_FIX_ERRATUM_843419 = yes;
        ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM = module;
        ARM_MHU_V2 = module;
        ARM_PSCI_CPUIDLE_DOMAIN = yes;
        ARM_SMMU_LEGACY_DT_BINDINGS = no;

        CPU_FREQ = yes;
        #CPU_FREQ_DEFAULT_GOV_ONDEMAND = yes;
        #CPU_FREQ_DEFAULT_GOV_PERFORMANCE = no;
        CPU_FREQ_GOV_POWERSAVE = yes;
        CPU_FREQ_GOV_ONDEMAND = yes;
        CPU_FREQ_GOV_SHEDUTIL = yes;
        CPUFREQ_DT = module;

        CLK_SUNXI = yes;
        CLK_SUNXI_CLOCKS = yes;
        CLK_SUNXI_PRCM_SUN6I = yes;
        CLK_SUNXI_PRCM_SUN8I = yes;
        CLK_SUNXI_PRCM_SUN9I = yes;

        PM_AUTOSLEEP = no;
        PM_GENERIC_DOMAINS_SLEEP = yes;
        PM_SLEEP = yes;
        PM_SLEEP_SMP = yes;
        #PM_WAKELOCKS = no;

        SECURITY = yes;
        ARM64_CRYPTO = yes;
        CRYPTO_SHA1_ARM64_CE = module;
        CRYPTO_SHA2_ARM64_CE = module;
        CRYPTO_SHA512_ARM64_CE = module;
        CRYPTO_SHA3_ARM64 = module;
        CRYPTO_SM3_ARM64_CE = module;
        CRYPTO_SM4_ARM64_CE = module;
        CRYPTO_GHASH_ARM64_CE = module;
        CRYPTO_AES_ARM64_CE_CCM = module;
        CRYPTO_AES_ARM64_CE_BLK = module;
        #CRYPTO_NHPOLY1305_NEON = no;
        CRYPTO_CHACHA20_NEON = module;
        CRYPTO_AES_ARM64_BS = module;

        CRYPTO_DEV_ALLWINNER = yes;
        CRYPTO_DEV_SUN4I_SS = yes;
        CRYPTO_DEV_SUN4I_SS_DEBUG = no;
        CRYPTO_DEV_SUN4I_SS_PRNG = yes;
        CRYPTO_DEV_SUN8I_CE = yes;
        CRYPTO_DEV_SUN8I_CE_DEBUG = no;
        CRYPTO_DEV_SUN8I_CE_HASH = yes;
        CRYPTO_DEV_SUN8I_CE_PRNG = yes;
        CRYPTO_DEV_SUN8I_CE_TRNG = yes;
        CRYPTO_DEV_SUN8I_SS = yes;
        CRYPTO_DEV_SUN8I_SS_DEBUG = no;
        CRYPTO_DEV_SUN8I_SS_HASH = yes;
        CRYPTO_DEV_SUN8I_SS_PRNG = yes;
        CRYPTO_DEV_VIRTIO = module;

        DRM_SUN4I = module;
        DRM_SUN4I_BACKEND = module;
        DRM_SUN4I_HMDI = module;
        #DRM_SUN4I_HMDI_AUDIO = module;
        #DRM_SUN4I_HMDI_CEC = module;
        DRM_SUN6I_DSI = module;
        DRM_SUN8I_DW_HDMI = module;
        DRM_SUN8I_MIXER = module;
        DRM_SUN8I_TCON_TOP = module;

        STAGING = yes;
        STAGING_MEDIA = yes;
        VIDEO_HANTRO = module;
        VIDEO_SUNXI = yes;
        VIDEO_SUNXI_CEDRUS = module;

        V4L_PLATFORM_DRIVERS = yes;
        VIDEO_SUN6I_CSI = module;

        SPI_SUN4I = yes;
        SPI_SUN6I = yes;
        SPI_SPIDEV = module;

        PWM = yes;
        PWM_SUN4I = module;

        PHY_SUN4I_USB = module;
        PHY_SUN50I_USB3 = module;
        PHY_SUN6I_MIPI_DPHY = module;
        PHY_SUN9I_USB = module;

        SUN8I_THERMAL = yes;
        IR_SUNXI = module;

        USB_MUSB_SUNXI = module;
        MMC_SUNXI = module;

        MTD_NAND_SUNXI = module;
        NVMEM_SUNXI_SID = module;

        MDIO_SUN4I = module;

        PINCTRL_SUN4I_A10 = no;
        PINCTRL_SUN50I_A100 = yes;
        PINCTRL_SUN50I_A100_R = yes;
        PINCTRL_SUN50I_A64 = yes;
        PINCTRL_SUN50I_A64_R = yes;
        PINCTRL_SUN50I_H5 = yes;
        PINCTRL_SUN50I_H6 = yes;
        PINCTRL_SUN50I_H616 = yes;
        PINCTRL_SUN50I_H616_R = yes;
        PINCTRL_SUN50I_H6_R = yes;
        PINCTRL_SUN5I = no;
        PINCTRL_SUN6I_A31 = no;
        PINCTRL_SUN6I_A31_R = no;
        PINCTRL_SUN8I_A23 = no;
        PINCTRL_SUN8I_A23_R = no;
        PINCTRL_SUN8I_A33 = no;
        PINCTRL_SUN8I_A83T = no;
        PINCTRL_SUN8I_A83T_R = no;
        PINCTRL_SUN8I_H3 = no;
        PINCTRL_SUN8I_H3_R = yes;
        PINCTRL_SUN8I_V3S = no;
        PINCTRL_SUN9I_A80 = no;
        PINCTRL_SUN9I_A80_R = no;
        PINCTRL_SUNXI = yes;

        RESET_SUNXI = yes;

        # RTC
        RTC_DRV_SUN6I = yes;
        RTC_HCTOSYS = yes;
        RTC_HCTOSYS_DEVICE = freeform "rtc1";
        RTC_SYSTOHC = yes;
        RTC_SYSTOHC_DEVICE = freeform "rtc1";

        DMA_SUN6I = module;

        # Ethernet
        NET_VENDOR_ALLWINNER = yes;
        NET_VENDOR_MICROSOFT = yes;
        DWMAC_SUN8I = module;
        DWMAC_SUNXI = module;
        MOTORCOMM_PHY = module;

        # WLAN
        SPARD_WLAN_SUPPORT = yes;
        SPRDWL_NG = module;
        UNISOC_WIFI_PS = yes;
        WLAN_UWE5622 = module;
        TTY_OVERY_SDIO = module;

        RFKILL = module;
        RFKILL_GPIO = module;
        RFKILL_INPUT = module;

        #RK_WIFI_DEVICE_UWE5621 = no;
        #RK_WIFI_DEVICE_UWE5622 = no;

        BT = module;
        BT_RFCOMM = module;
        BT_RFCOMM_TTY = yes;
        BT_BNEP = module;
        BT_BNEP_MC_FILTER = yes;
        BT_BNEP_PROTO_FILTER = yes;
        BT_HIDP = module;
        BT_HS = yes;
        BT_LEDS = yes;
        BT_HCIBTUSB = module;
        BT_HCIBTSDIO = module;
        BT_HCIUART = module;
        BT_HCIUART_NOKIA = module;
        BT_HCIUART_BCSP = yes;
        BT_HCIUART_ATH3K = yes;
        BT_HCIUART_LL = yes;
        BT_HCIUART_INTEL = yes;
        BT_HCIUART_BCM = yes;
        BT_HCIUART_RTL = yes;
        BT_HCIUART_QCA = yes;
        BT_HCIUART_AG6XX = yes;
        BT_HCIUART_MRVL = yes;
        BT_HCIBCM203X = module;
        BT_HCIBPA10X = module;
        BT_HCIBFUSB = module;
        BT_HCIVHCI = module;

        # Sound
        DRM_DW_HDMI_I2S_AUDIO = module;
        SND_SOC_SUN50I_AHUB = module;
        SND_SOC_SUN50I_HDMI = module;
        SND_SOC_HDMI_CODEC = module;

        SND_SUN4I_I2S = module;
        SND_SUN4I_SPDIF = module;
        SND_SUN4I_CODEC = module;
        SND_SUN50IW9_CODEC = module;
        SND_SUN50I_CODEC_ANALOG = module;
        SND_SUN8I_ADDA_PR_REGMAP = module;
        SND_SUN8I_CODEC = module;
        SND_SUN8I_CODEC_ANALOG = module;
        SND_VIRTIO = module;

        # unordered
        SUN4I_EMAC = module;
        SUN4I_GPADC = module;
        SUN50I_A100_CCU = yes;
        SUN50I_A100_R_CCU = yes;
        SUN50I_A64_CCU = yes;
        SUN50I_DE2_BUS = yes;
        SUN50I_ERRATUM_UNKNOWN1 = yes;
        SUN50I_H616_CCU = yes;
        SUN50I_H6_CCU = yes;
        SUN50I_H6_R_CCU = yes;
        SUN50I_IOMMU = yes;
        SUN6I_MSGBOX = yes;
        SUN8I_A83T_CCU = yes;
        SUN8I_DE2_CCU = yes;
        SUN8I_H3_CCU = yes;
        SUN8I_R_CCU = yes;
        SUNXI_CCU = yes;
        SUNXI_MBUS = yes;
        SUNXI_RSB = yes;
        SUNXI_SRAM = yes;
        #SUNXI_SYS_INFO = yes;
        SUNXI_WATCHDOG = module;
      };
      kernelPatches = [
        {
          name = "h616-patches";
          patch = [
            ./patches/0001-arm64-dts-allwinner-Add-Allwinner-H616-.dtsi-file.patch
            ./patches/0002-dt-bindings-arm-sunxi-Add-two-H616-board-compatible-.patch
            ./patches/0003-arm64-dts-allwinner-h616-Add-OrangePi-Zero-2-board-s.patch
            ./patches/0004-arm64-dts-allwinner-h616-Add-X96-Mate-TV-box-support.patch
            ./patches/0005-arm64-dts-allwinner-h616-Add-USB-nodes.patch
            ./patches/0006-arm64-dts-allwinner-h616-OrangePi-Zero-2-Add-USB-nod.patch
            ./patches/0007-arm64-dts-allwinner-h616-X96-Mate-Add-USB-nodes.patch
            ./patches/0008-rtc-sun6i-Add-Allwinner-H616-support.patch
            ./patches/0009-arm64-dts-allwinner-h616-Add-RTC-and-its-32K-clock.patch
            ./patches/0010-nvmem-sunxi_sid-Support-SID-on-H616.patch
            ./patches/0011-arm64-dts-allwinner-h616-Add-device-node-for-SID.patch
            ./patches/0012-thermal-drivers-sun8i-Add-thermal-driver-for-H616.patch
            ./patches/0013-arm64-dts-allwinner-h616-Add-thermal-sensor-and-ther.patch
            ./patches/0014-dt-bindings-net-sun8i-emac-Add-H616-compatible-strin.patch
            ./patches/0015-net-stmmac-dwmac-sun8i-Prepare-for-second-EMAC-clock.patch
            ./patches/0016-wip-h616-hdmi.patch
            ./patches/0017-arm64-dts-allwinner-h616-Add-GPU-node.patch
            ./patches/0018-arm64-dts-allwinner-h616-orangepi-zero2-Enable-GPU.patch
            ./patches/0019-media-cedrus-add-H616-variant.patch
            ./patches/0020-soc-sunxi-sram-Add-SRAM-C1-H616-handling.patch
            ./patches/0021-arm64-dts-allwinner-h616-Add-VPU-node.patch
            ./patches/0022-media-hevc-Add-scaling-matrix-control.patch
            ./patches/0023-media-cedrus-hevc-Add-support-for-scaling-lists.patch
            ./patches/0024-media-cedrus-Don-t-kernel-map-most-buffers.patch
            ./patches/0025-media-cedrus-hevc-tiles-hack.patch
            ./patches/0026-media-cedrus-Add-callback-for-buffer-cleanup.patch
            ./patches/0027-media-cedrus-hevc-Improve-buffer-management.patch
            ./patches/0028-media-cedrus-h264-Improve-buffer-management.patch
            ./patches/0029-media-cedrus-add-check-for-H264-and-HEVC-limitations.patch
            ./patches/0030-WIP-media-uapi-hevc-add-fields-needed-for-rkvdec.patch
            ./patches/0031-HACK-media-uapi-hevc-tiles-and-num_slices.patch
            ./patches/0032-WIp-10-bit-HEVC-support.patch
            ./patches/0033-bus-sun50i-de2-Adjust-printing-error-message.patch
            ./patches/0034-T95-eth-sd-card-hack.patch
            ./patches/0035-x96-hdmi.patch
            ./patches/0036-bus-sunxi-rsb-Fix-shutdown.patch
            ./patches/0037-phy-sun4i-usb-Rework-HCI-PHY-aka.-pmu_unk1-handling.patch
            ./patches/0038-phy-sun4i-usb-Allow-reset-line-to-be-shared.patch
            ./patches/0039-phy-sun4i-usb-Introduce-port2-SIDDQ-quirk.patch
            ./patches/0040-phy-sun4i-usb-Add-support-for-the-H616-USB-PHY.patch
            ./patches/0041-rtc-sun6i-Fix-time-overflow-handling.patch
            ./patches/0042-rtc-sun6i-Add-support-for-linear-day-storage.patch
            ./patches/0043-rtc-sun6i-Add-support-for-broken-down-alarm-register.patch
            ./patches/0044-rtc-sun6i-Add-support-for-RTCs-without-external-LOSC.patch
            ./patches/0045-sun8i-de33-Fixed-of_sunxi_ccu_probe.patch
            ./patches/0046-Support-h616-ahub-and-hdmi-audio.patch
            ./patches/0047-Added-unisoc-uwe5622-wifi-bt-driver.patch
            ./patches/0048-OrangePi-Zero2-dts-Set-dcdcd-to-1.4v.patch
            ./patches/0049-uwe5622-Fixed-paths-in-makefiles.patch
            ./patches/0050-uwe5622-Using-ktime_t-for-timings.patch
            ./patches/0051-sun50i-ahub-Resolved-circular-dependencies-between-m.patch
          ];
        }
      ];
    };
in pkgs.linuxPackagesFor linux
