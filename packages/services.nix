{pkgs, ...}: {
  imports = [
    ./zapret
  ];
  services.xserver = {
    enable = true;
    xkb.layout = "us,ru";
    xkb.options = "grp:caps_toggle";
    excludePackages = [ pkgs.xterm ];
  };
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };
  services.libinput.enable = true;
  services.openssh.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
    jack.enable = true;
  };
  services.dbus.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
