{ config, pkgs, ...}: {
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;
  programs.niri.settings = {
    # Input
    input = {
      keyboard.xkb = {
        layout = "us,ru";
        options = "grp:caps_toggle";
      };
  
      touchpad = {
          tap = true;
          natural-scroll = true;
      };
    };

    # My main monitor on worldmachine
    outputs."HDMI-A-1" = {
      enable = true;
      mode = {
          width = 1920;
          height = 1080;
          refresh = 100.000;
      };
      scale = 1;
      position = { x = 1280; y = 0; };
    };
  
    # Disable Hot-corner
    gestures.hot-corners.enable = false;
  
    # Fix for electron apps (like discord, obsidian, steam and etc)
    environment."NIXOS_OZONE_WL" = "1";

    # Rule for transparent background in overview
    layer-rules = [
      {
        matches = [ { namespace = "^wallpaper$"; } ];
        place-within-backdrop = true;
      }
    ];

    # Window rules
    window-rules = [
      {
        matches = [ { app-id = "steam"; title = "^notificationtoasts_\\d+_desktop$"; } ];
        default-floating-position = {
          x = 10; y = 10;
          relative-to = "bottom-right";
        };
        open-focused = false;
      }
      {
        matches = [
          { app-id = "kitty"; title = "^termfilechooser$"; }
          { app-id = "file_chooser"; title = "^ranger$"; }
        ];
        open-floating = true;
        max-height = 480;
        max-width = 640;
        default-window-height.fixed = 480;
      }
      {
        clip-to-geometry = true;
        geometry-corner-radius = {
          bottom-left = 12.0;
          bottom-right = 12.0;
          top-left = 12.0;
          top-right = 12.0;
        };
      }
    ];

    # Layout settings
    layout = {
      gaps = 16;
      center-focused-column = "never";
      background-color = "transparent";
      default-column-width.proportion = 0.5;
      focus-ring.enable = false;
      border = {
        enable = true;
        width = 2;
        active = { color = "#9654DF"; };
        inactive = { color = "#6442A5"; };
        urgent = { color = "#D5206A"; };
      };
    };

    # Start dunst and background daemon
    spawn-at-startup = [ 
      { argv = [ "dunst" ]; }
      { argv = [ "waybar" ]; }
      { sh = "swaybg -i ~/.config/nixos/home/niri/wallpaper.png"; }
    ];
    
    prefer-no-csd = true;
  
    # Binds
    binds = with config.lib.niri.actions; {
      "Mod+T".action = spawn "kitty";
      "Mod+Space".action = spawn "rofi" "-show" "drun";
      "XF86AudioRaiseVolume" = { action = spawn-sh "${./scripts/media} volume_up"; allow-when-locked=true; };
      "XF86AudioLowerVolume" = { action = spawn-sh "${./scripts/media} volume_down"; allow-when-locked=true; };
      "XF86MonBrightnessUp" = { action = spawn "brightnessctl" "--class=backlight" "set" "+10%"; allow-when-locked=true; };
      "XF86MonBrightnessDown" = { action = spawn "brightnessctl" "--class=backlight" "set" "10%-"; allow-when-locked=true; };
      "XF86AudioNext" = { action = spawn-sh "playerctl next"; repeat=false; allow-when-locked=true; };
      "XF86AudioPause" = { action = spawn-sh "playerctl play-pause"; repeat=false; allow-when-locked=true; };
      "XF86AudioPlay" = { action = spawn-sh "playerctl play-pause"; repeat=false; allow-when-locked=true; };
      "XF86AudioPrev" = { action = spawn-sh "playerctl previous"; repeat=false; allow-when-locked=true; };
      "Mod+O" = { action = toggle-overview; repeat=false; };
      "Mod+Q" = { action = close-window; repeat=false; };
      "Mod+H".action = focus-column-left;
      "Mod+J".action = focus-window-down;
      "Mod+K".action = focus-window-up;
      "Mod+L".action = focus-column-right;
      "Mod+Shift+H".action = move-column-left;
      "Mod+Shift+J".action = move-window-down;
      "Mod+Shift+K".action = move-window-up;
      "Mod+Shift+L".action = move-column-right;
      "Mod+Home".action = focus-column-first;
      "Mod+End".action = focus-column-last;
      "Mod+Ctrl+Home".action = move-column-to-first;
      "Mod+Ctrl+End".action = move-column-to-last;
      "Mod+Ctrl+J".action = focus-workspace-down;
      "Mod+Ctrl+K".action = focus-workspace-up;
      "Mod+Shift+Ctrl+J".action = move-column-to-workspace-down;
      "Mod+Shift+Ctrl+K".action = move-column-to-workspace-up;
      "Mod+Ctrl+1".action = focus-workspace 1;
      "Mod+Ctrl+2".action = focus-workspace 2;
      "Mod+Ctrl+3".action = focus-workspace 3;
      "Mod+Ctrl+4".action = focus-workspace 4;
      "Mod+Ctrl+5".action = focus-workspace 5;
      "Mod+Ctrl+6".action = focus-workspace 6;
      "Mod+Ctrl+7".action = focus-workspace 7;
      "Mod+Ctrl+8".action = focus-workspace 8;
      "Mod+Ctrl+9".action = focus-workspace 9;
      "Mod+BracketLeft".action = consume-or-expel-window-left;
      "Mod+BracketRight".action = consume-or-expel-window-right;
      "Mod+Comma".action = consume-window-into-column;
      "Mod+Period".action = expel-window-from-column;
      "Mod+R".action = switch-preset-column-width;
      "Mod+Shift+R".action = switch-preset-window-height;
      "Mod+Ctrl+R".action = reset-window-height;
      "Mod+F".action = maximize-column;
      "Mod+Shift+F".action = fullscreen-window;
      "Mod+Ctrl+F".action = expand-column-to-available-width;
      "Mod+C".action = center-column;
      "Mod+Minus".action = set-column-width "-10%";
      "Mod+Equal".action = set-column-width "+10%";
      "Mod+Shift+Minus".action = set-window-height "-10%";
      "Mod+Shift+Equal".action = set-window-height "+10%";
      "Mod+V".action = toggle-window-floating;
      "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;
      "Mod+W".action = toggle-column-tabbed-display;
      "Mod+Shift+3".action = spawn "${./scripts/screenshot}";
      "Mod+Shift+4".action = spawn "${./scripts/selection-screenshot}";
      "Mod+Shift+E".action = quit;
      "Mod+Shift+P".action = power-off-monitors;
      "Mod+P".action = spawn-sh "${./scripts/powermenu/script} ${./scripts/powermenu/powermenu.rasi}";
    };
  };
}
