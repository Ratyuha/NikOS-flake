{config, pkgs, ...}: {
  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/DAC2D981C2D961F5";
    fsType = "ntfs";
    options = [ "defaults" "nofail" ];
  };
}

