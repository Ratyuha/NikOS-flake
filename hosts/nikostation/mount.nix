{config, pkgs, ...}: {
  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/2d939831-c2d5-4d1c-8f30-0c183c4574b6";
    fsType = "ext4";
    options = [ "defaults" "nofail" ];
  };
}

