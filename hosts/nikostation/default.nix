{config, pkgs, ...}: {
  imports = [
    ./programs.nix
    ./services.nix
    ./mount.nix
    ./autorandr.nix
  ];
}
