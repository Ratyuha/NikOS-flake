{ config, lib, pkgs, ... }: {
  home = {
    username = "ratyuha";
    homeDirectory = "/home/ratyuha";
    stateVersion = "25.11";
    packages = [ ];
  };

  imports = [
    ./kitty.nix
    ./zsh.nix
    ./niri
    ./rofi
    ./dunst.nix
    ./gh.nix
    ./gtk.nix
    ./fastfetch
    ./xdg.nix
  ];
}
