{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = builtins.readFile ./style.css;
    settings = [{
      layer = "top";
      position = "top";
      height = 28;
      margin = "8";
      spacing = 8;
      reload_style_on_change = true;
      modules-left = [ "image#niko" "clock" ];
      modules-right = [ "network" "bluetooth" "battery" ];
      clock = {
        tooltip-format = "{calendar}";
        format = "  {:%H:%M}";
      };
      battery = {
        interval = 60;
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-icons = ["" "" "" "" ""];
        max-length = 25;
      };
      network = {
        format-ethernet = "";
        format-wifi = "󰖩";
        format-disconnected = "󰖪";
        format-disabled = "󱚼";
        format = "{icon}";
        tooltip-format = "{ifname} via {gwaddr} 󰊗";
        tooltip-format-wifi = "{essid} ({signalStrength}%) ";
        tooltip-format-ethernet = "{ifname} ";
        tooltip-format-disconnected = "Disconnected";
      };
      bluetooth = {
        format-disabled = "󰂲";
        format-off = "󰂲";
        format-on = "";
        format-connected = "󰂱";
        tooltip-format = "{controller_alias}\t{controller_address}";
        tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
      };
      "image#niko" = {
        path = "/home/ratyuha/nix/home/waybar/niko.png";
        size = 28;
      };
    }];
  };
}
