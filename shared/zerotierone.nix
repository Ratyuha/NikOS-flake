{config, pkgs, ...}: {
  services.zerotierone = {
    enable = true;
    joinNetworks = [ "88c5b1f339bfdecf" ];
  };
}
