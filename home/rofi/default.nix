{...}: {
  programs.rofi = {
    enable = true;
    theme = ./niko.rasi;
    extraConfig = {
      show-icons = true;
      display-drun = "";
      drun-display-format = "{icon} {name}";
    };
  };
}
