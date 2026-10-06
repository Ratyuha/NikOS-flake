{config, pkgs, ...}: {
  imports = [
    ./programs.nix
    ./services.nix
    ./flatpak.nix
  ];
}
