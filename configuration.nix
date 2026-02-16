{ pkgs, ... }:

{
  imports = [./packages];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 27005 27015 27016 ];
      allowedUDPPorts = [ 22 80 443 27005 27015 27016 ];
    };
  };

  # Timezone
  time.timeZone = "Europe/Kaliningrad";

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "ru_RU.UTF-8/UTF-8" ];

  # User
  users.users.ratyuha = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" ];
  };
  security.sudo = {
    enable = true;
    extraConfig = "ratyuha ALL=(ALL:ALL) ALL";
  };
  security.rtkit.enable = true;

  environment.sessionVariables = {
    "NIXOS_OZONE_WL" = "1";
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}
