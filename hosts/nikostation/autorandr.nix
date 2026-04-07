{ pkgs, lib, ... }: {
  services.autorandr = {
    enable = true;
    profiles = {
      "main" = {
        fingerprint = {
          HDMI-0 = "00ffffffffffff001e6dd556010101010313010380301b780a3d85a6564a9a24125054a56f008180818f7140b300814fd1c0010101011a3680a070381f4030203500dc0c1100001a21399030621a274068b03600dc0c1100001c000000fd00384b1e5311000a202020202020000000fc004d32323757440a20202020202001f602031ff14e84050302202210111312141f07162309070767030c002000b82c011d007251d01e2038881500dc0c1100001e011d8018711c1620582c2500dc0c1100009e8c0ad08a20e02d10103e9600dc0c110000188c0ad08a20e02d10103e9600dc0c11000018023a801871382d40582c4500dc0c1100001e000000000000e1";
        };
        config = {
          HDMI-0 = {
            enable = true;
            crtc = 0;
            primary = true;
            position = "0x0";
            mode = "1680x1050";
            rate = "59.95"; # my monitor is shit so that's why 59.95
          };
        };
      };
    };
  };
}
