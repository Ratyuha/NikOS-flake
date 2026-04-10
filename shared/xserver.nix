{config, pkgs, ...}: {
  services.xserver = {
    enable = true;
    xkb.layout = "us,ru";
    xkb.options = "grp:caps_toggle";
    windowManager.i3.enable = true;
    excludePackages = [ pkgs.xterm ];
  };
}
