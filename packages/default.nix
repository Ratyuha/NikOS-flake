{config, pkgs, ...}: {
  imports = [
    ./programs.nix
    ./services.nix
  ];
}
