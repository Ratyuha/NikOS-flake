{ pkgs, ... }:

{
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

  # Hosts
  networking.extraHosts = "
    185.199.109.133 release-assets.githubusercontent.com
  ";

  # Timezone
  time.timeZone = "Europe/Kaliningrad";

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "ru_RU.UTF-8/UTF-8" ];

  # User
  users.users.ratyuha = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" "docker" "lp" "scanner" ];
  };
  security.sudo = {
    enable = true;
    extraConfig = "ratyuha ALL=(ALL:ALL) NOPASSWD: ALL";
  };
  security.rtkit.enable = true;

  environment.sessionVariables = {
    "NIXOS_OZONE_WL" = "1";
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # mirrors
  nix.settings = {
    substituters = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
    ];
    trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
  };

  system.stateVersion = "25.11";
}
