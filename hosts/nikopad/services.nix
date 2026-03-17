{config, pkgs, ...}: {
  services.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };
}
