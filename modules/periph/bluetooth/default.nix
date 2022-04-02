{ ... }: {
  imports = [
    ./attach.nix
  ];

  hardware.bluetooth.attach = {
    uwe5622 = {
      method = "hciattach";
      params = ["-n" "-s" 1500000 "ttyBT0" "sprd"];
    };
    rtl8723bs = {
      method = "hciattach";
      params = ["-n" "-s" 115200 "ttyS1" "rtk_h5"];
    };
  };
}
