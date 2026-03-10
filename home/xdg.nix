{ pkgs, ... }: {
  xdg.enable = true;
  xdg.autostart.enable = true;
  xdg.mime.enable = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = let 
      browser = [ "firefox.desktop" ];
    in {
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
      "application/pdf" = "firefox.desktop";
      "image/*" = "feh.desktop";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = [ "gnome" ];
      };
      niri = {
        default = [ "gnome" "wlr" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gnome" ];
      };
    };
    xdgOpenUsePortal = false;
  };
}
