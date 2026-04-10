{config, pkgs, ...}: {
  imports = [
    ./zapret
    ./xserver.nix
    ./pipewire.nix
    ./hardware.nix
    ./flatpak.nix
    ./zerotierone.nix
  ];
  services.displayManager.sddm.enable = true;
  services.libinput.enable = true;
  services.openssh.enable = true;
  services.dbus.enable = true;
  services.udisks2.enable = true;
  virtualisation.docker.enable = true;
}
