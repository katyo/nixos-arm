{ pkgs, lib }:
let version = "6.2.1";
    linux = pkgs.linux_6_2_embedded.override {
      structuredExtraConfig = with lib.kernel; {
        HIBERNATION = no;
        SUSPEND_FREEZER = yes;
        ENERGY_MODEL = yes;

        # ???
        MFD_SUN6I_PRCM = yes;
        ARM_FFA_TRANSPORT = yes;
        HW_RANDOM = yes;

        #CPU_FREQ_DEFAULT_GOV_ONDEMAND = yes;
        #CPU_FREQ_DEFAULT_GOV_PERFORMANCE = no;
        CPU_FREQ_GOV_POWERSAVE = yes;
        CPU_FREQ_GOV_ONDEMAND = yes;
        CPU_FREQ_GOV_SHEDUTIL = yes;

        ARCH_SUNXI = yes;
        ARM_SCPI_PROTOCOL = yes; #module;
        DMADEVICES = yes;
        DMA_SUN6I = yes; #module;
        DUMP_REG = module;
        DUMP_REG_MISC = module;
        DWMAC_SUN8I = module;
        I2C = yes; #module;
        I2C_MV64XXX = yes; #module;
        IR_SUNXI = module;
        MMC = yes; #module;
        MMC_SUNXI = module;
        NET_VENDOR_STMICRO = yes;
        NVMEM_SUNXI_SID = yes; #module;
        PHY_SUN4I_USB = module;

        PINCTRL_SUN8I_H3_R = no;
        PINCTRL_SUN50I_A64 = no;
        PINCTRL_SUN50I_A64_R = no;
        PINCTRL_SUN50I_A100 = no;
        PINCTRL_SUN50I_A100_R = no;
        PINCTRL_SUN50I_H5 = no;

        # RTC
        RTC_DRV_SUN6I = yes;
        RTC_LIB = yes;
        RTC_HCTOSYS = yes;
        RTC_HCTOSYS_DEVICE = freeform "rtc1";
        RTC_SYSTOHC = yes;
        RTC_SYSTOHC_DEVICE = freeform "rtc1";

        SERIAL_8250 = yes;
        SERIAL_8250_DW = yes;

        SND = module;
        SND_SOC = module;
        SPI = yes;
        SPI_SUN6I = yes; #module;
        STAGING = yes;
        STAGING_MEDIA = yes;
        STMMAC_ETH = yes; #module;
        STMMAC_PLATFORM = yes; #module;
        SUN50I_A64_CCU = yes; #module;
        SUN50I_A100_CCU = yes; #module;
        SUN50I_A100_R_CCU = yes; #module;
        SUN8I_H3_CCU = no;
        SUN8I_R_CCU = no;
        SUN50I_H6_R_CCU = yes; #module;
        SUN6I_RTC_CCU = module;
        SUN8I_THERMAL = yes; #module;
        SUNXI_ADDR_MGMT = module;
        SUNXI_RSB = yes; #module;
        SUNXI_SRAM = yes;
        SUNXI_SYS_INFO = yes; #module;
        SUNXI_WATCHDOG = yes; #module;

        USB = yes;
        USB_EHCI_HCD = yes;
        USB_EHCI_HCD_PLATFORM = yes;
        USB_MUSB_HDRC = yes;
        USB_MUSB_SUNXI = module;
        USB_OHCI_HCD_PLATFORM = yes;
        USB_PHY = yes;
        VIDEO_SUNXI = yes;
        VIDEO_SUNXI_CEDRUS = module;
        WATCHDOG = yes;

        # boards
        LEDS_GPIO = yes; #module;
        MFD_AXP20X_RSB = yes; #module;
        MFD_AXP20X_I2C = yes; #module;
        NEW_LEDS = yes;
        PWRSEQ_SIMPLE = yes; #module;
        REGULATOR = yes;
        REGULATOR_FIXED_VOLTAGE = yes;
        REGULATOR_AXP20X = yes; #module;

        # temp
        ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM = yes;
        CPU_FREQ = yes;
        CPUFREQ_DT = yes;
        ARM_SCPI_CPUFREQ = module;

        PM = yes;
        PM_GENERIC_DOMAINS = yes;

        # extras
        HWSPINLOCK = yes;
        HWSPINLOCK_SUN6I = module;
        SPI_SPIDEV = module;

        # wireless
        SPARD_WLAN_SUPPORT = yes;
        SPRDWL_NG = module;
        UNISOC_WIFI_PS = yes;
        WLAN_UWE5622 = module;
        TTY_OVERY_SDIO = module;

        # H6
        AC200_PHY = module;
        COMMON_CLK_PWM = yes; #module;
        CRYPTO = yes; #module;
        CRYPTO_DEV_ALLWINNER = yes;
        CRYPTO_DEV_SUN4I_SS = yes;
        CRYPTO_DEV_SUN4I_SS_PRNG = yes;
        CRYPTO_DEV_SUN8I_CE = yes; #module;
        CRYPTO_DEV_SUN8I_CE_HASH = yes;
        CRYPTO_DEV_SUN8I_CE_PRNG = yes;
        CRYPTO_DEV_SUN8I_CE_TRNG = yes;
        CRYPTO_DEV_SUN8I_SS = yes;
        CRYPTO_DEV_SUN8I_SS_PRNG = yes;
        CRYPTO_DEV_SUN8I_SS_HASH = yes;
        MFD_AC200 = yes;
        PHY_SUN50I_USB3 = yes; #module;
        PINCTRL_SUN50I_H6 = yes;
        PINCTRL_SUN50I_H6_R = yes;
        PWM_SUN4I = module;
        SUN50I_H6_CCU = yes; #module;
        SUN50I_IOMMU = yes;
        SUN6I_MSGBOX = yes; #module;
        USB_DWC3 = yes; #module;
        VIDEO_HANTRO = module;

        # H616
        PINCTRL_SUN50I_H616 = yes;
        PINCTRL_SUN50I_H616_R = yes;
        PWM_SUNXI_ENHANCE = module;
        SUN50I_H616_CCU = yes; #module;

        # boards
        MTD = yes; #module;
        MTD_SPI_NOR = yes; #module;

        # H6 & H616
        DRM = yes; #module;
        DRM_DISPLAY_CONNECTOR = module;
        DRM_PANFROST = module;
        DRM_SUN4I = module;
        DRM_SUN8I_DW_HDMI = module;
        DRM_SUN8I_MIXER = module;
        DRM_SUN8I_TCON_TOP = module;

        # H6
        SOUND = yes; #module;
        SND_SIMPLE_CARD = module;
        SND_SOC_ACX00 = module;
        SND_SUN4I_I2S = module;
        SND_SUN4I_SPDIF = module;
        SND_SUN9I_HDMI_AUDIO = module;

        # H616
        SND_SOC_SUN50I_AHUB = module;
        SND_SOC_SUN50I_HDMI = module;
        SND_SUN50IW9_CODEC = module;

        # Fixes
        DRM_DW_HDMI = module;

        # extras
        ZRAM_DEF_COMP_ZSTD = yes;
        ZSWAP = yes;
        ZSWAP_DEFAULT_ON = yes;
        ZSWAP_COMPRESSOR_DEFAULT_ZSTD = yes;

        #MODULE_COMPRESS_XZ = yes;
      };
      kernelPatches = [
        {
          name = "sunxi64-patches";
          patch = let patchesPath = ./. + "/v${version}-patches";
                      isPatchFile = name: value:
                        value == "regular" && (lib.hasSuffix ".patch" name);
                      patchFilePath = name: patchesPath + "/${name}";
                  in map patchFilePath (lib.naturalSort
                     (lib.attrNames (lib.filterAttrs isPatchFile
                      (builtins.readDir patchesPath))));
        }
      ];
    };
in pkgs.linuxPackagesFor linux
