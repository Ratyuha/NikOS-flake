{lib, ...}: {
  programs.i3blocks = {
    enable = true;
    bars = {
      main = {
        time = {
          command = "date +%T";
          interval = 1;
        };
      };
    };
  };
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      terminal = "kitty";
      fonts = {
        names = [ "3270 Nerd Font Mono" ];
        size = 13.0;
      };
      window = {
        border = 2;
        titlebar = false;
      };
      floating = {
        modifier = "Mod4";
        titlebar = false;
      };
      gaps = {
        inner = 8;
        top = 8;
        left = 8;
        bottom = 8;
        right = 8;
      };
      colors = {
        background = "#FFFFFF";
        focused = {
          background = "#FFFFFF";
          border = "#9654DF";
          text = "#000000";
          indicator = "#9654DF";
          childBorder = "#9654DF";
        };
        unfocused = {
          background = "#262626";
          border = "#6442A5";
          text = "#E6E6E6";
          indicator = "#6442A5";
          childBorder = "#6442A5";
        };
        urgent = {
          background = "#AC6D74";
          border = "#D5206A";
          text = "#000000";
          indicator = "#D5206A";
          childBorder = "#D5206A";
        };
      };
      bars = [
        {
          colors = {
            focusedWorkspace = { border = "#FFFFFF"; background = "#FFFFFF"; text = "#000000"; };
            inactiveWorkspace = { border = "#000000"; background = "#000000"; text = "#E6E6E6"; };
            background = "#000000";
          };
          fonts = {
            names = ["3270 Nerd Font Mono"];
            size = 11.0;
          };
          mode = "dock";
          position = "top";
          statusCommand = "i3blocks -c ~/.config/i3blocks/main";
        }
      ];
      startup = [
        { command = "dunst"; notification = true; }
        { command = "feh --bg-center ${./wallpaper.png}"; }
      ];
      keybindings = let
        wss = lib.lists.range 0 9;
      in {
        "mod4+t" = "exec kitty";
        "mod4+q" = "kill";
        "mod4+space" = "exec rofi -show drun";
        "mod4+p" = "exec ${./scripts/powermenu/script} ${./scripts/powermenu/powermenu.rasi}";
        "mod4+Shift+e" = "exec \"i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'\"";

        "XF86AudioRaiseVolume" = "exec ${./scripts/media} volume_up";
        "XF86AudioLowerVolume" = "exec ${./scripts/media} volume_down";
        "XF86AudioPlay" = "exec ${./scripts/media} play_pause";
        "XF86AudioMute" = "exec ${./scripts/media} volume_mute";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";

        "mod4+Shift+3" = "exec ${./scripts/screenshot}";
        "mod4+Shift+4" = "exec ${./scripts/selection-screenshot}";

        "mod4+h" = "focus left";
        "mod4+j" = "focus down";
        "mod4+k" = "focus up";
        "mod4+l" = "focus right";

        "mod4+Shift+h" = "move left";
        "mod4+Shift+j" = "move down";
        "mod4+Shift+k" = "move up";
        "mod4+Shift+l" = "move right";

        "mod4+plus" = "resize grow width 10 px or 10 ppt";
        "mod4+minus" = "resize shrink width 10 px or 10 ppt";
        "mod4+Shift+plus" = "resize grow height 10 px or 10 ppt";
        "mod4+Shift+minus" = "resize shrink height 10 px or 10 ppt";

        "mod4+Shift+f" = "fullscreen";
        "mod4+Shift+v" = "focus mode_toggle";
        "mod4+v" = "floating toggle";
        "mod4+c" = "move position center";

        "mod4+w" = "layout tabbed";
        "mod4+e" = "layout toggle split";
        "mod4+d" = "splith";
        "mod4+s" = "splitv";

        "XF86MonBrightnessDown" = "exec brightnessctl set 1%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 1%+";

        "mod4+Ctrl+h" = "workspace prev";
        "mod4+Ctrl+l" = "workspace next";

        "mod4+Shift+Ctrl+h" = "move container to workspace prev; workspace prev";
        "mod4+Shift+Ctrl+l" = "move container to workspace next; workspace next";
      }
        // builtins.listToAttrs (
          map (w: let
            str = toString w;
          in { 
            name = "mod4+Ctrl+${str}";
            value = "workspace number ${str}";
          }) wss 
        )
        // builtins.listToAttrs (
          map (w: let
              str = toString w;
            in { 
            name = "mod4+Shift+Ctrl+${str}";
            value = "move container to workspace number ${str}; workspace number ${str}";
          }) wss 
        );
    };
  };
}
