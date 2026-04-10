{pkgs, config, lib, ...}: {
  services.picom = {
    enable = true;
    settings = lib.mkForce {
      backend = "glx";
      dithered-present = false;
      vsync = true;
      corner-radius = 10.0;
      detect-rounded-corners = true;
      detect-client-opacity = true;
      detect-transient = true;
      use-damage = true;
      transparent-clipping = false;
      log-level = "warn";
      fading = true;
      fade-in-step = 0.1;
      fade-out-step = 0.1;
      blur-method = "dual_kawase";
      blur-size = 4;
      blur-strength = 4;
    };
  };
}
