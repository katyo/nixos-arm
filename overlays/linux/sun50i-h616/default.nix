{ pkgs, lib }:
let linux = pkgs.linux_5_17.override {
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
        ARM_MHU = yes;
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
        #DRM_SUN4I_BACKEND = module;
        #DRM_SUN4I_HMDI = module;
        ##DRM_SUN4I_HMDI_AUDIO = module;
        DRM_SUN4I_HMDI_CEC = yes;
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
        SUNXI_ADDR_MGMT = module;
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
        RFKILL_INPUT = yes;

        # Bluetooth
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
            ./patches/arch.patch
            ./patches/dts.patch
            ./patches/clk.patch
            ./patches/gpu.patch
            ./patches/i2c.patch
            ./patches/mfd.patch
            ./patches/mac.patch
            ./patches/eth.patch
            ./patches/wifi.patch
            ./patches/sid.patch
            ./patches/usb.patch
            ./patches/rtc.patch
            ./patches/sram.patch
            ./patches/media.patch
            ./patches/hwmon.patch
            ./patches/sound.patch
          ];
        }
      ];
    };
in pkgs.linuxPackagesFor linux
