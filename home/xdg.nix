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
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
      # xdg-desktop-portal-gtk
      xdg-desktop-portal-termfilechooser
    ];
    config.niri = {
      default = [ "gnome" "wlr" "termfilechooser" ];
      "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
    };
    xdgOpenUsePortal = false;
  };

  home.sessionVariables = {
    TERMCMD = "kitty --class=file_chooser";
    GDK_DEBUG = "portals";
    GTK_USE_PORTAL = "1";
    QT_QPA_PLATFORMTHEME = "xdgdesktopportal";
  };

  xdg.configFile."xdg-desktop-portal-termfilechooser/config" = {
    force = true;
    text =
    ''
      [filechooser]
      cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/ranger-wrapper.sh
    '';
  };
}
