{config, pkgs, ...}: {
  imports = [
    ./zapret
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
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
  services.udisks2.enable = true;
  services.zerotierone = {
    enable = true;
    joinNetworks = [ "88c5b1f339bfdecf" ];
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ vpl-gpu-rt ];
  };
  virtualisation.docker.enable = true;
}
