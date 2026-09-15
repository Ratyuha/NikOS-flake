{config, pkgs, lib, ...}: {
  programs.nixvim = {
    enable = true;
    imports = [
      ./settings.nix
    ];
  };
}
