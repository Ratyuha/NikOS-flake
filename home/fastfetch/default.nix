{...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = ./lightbulb.png;
        width = 16;
        padding = {
          top = 1;
        };
      };
      display = {
        separator = " ";
      };
      modules = [
        {
          key = " ";
          type = "custom";
        }
        {
          key = "------------------------------------";
          type = "custom";
        }
        {
          key = "  {#31} system  {#keys}";
          type = "title";
          format = "{user-name}@{host-name}";
        }
        {
          key = "  {#33}󰅐 uptime  {#keys}";
          type = "uptime";
        }
        {
          key = "  {#34}{icon} distro  {#keys}";
          type = "os";
        }
        {
          key = "  {#35} kernel  {#keys}";
          type = "kernel";
        }
        {
          key = "  {#36}󰇄 desktop {#keys}";
          type = "de";
        }
        {
          key = "  {#31} term    {#keys}";
          type = "terminal";
        }
        {
          key = "  {#32} shell   {#keys}";
          type = "shell";
        }
        {
          key = "------------------------------------";
          type = "custom";
        }
        {
          key = "        ";
          type = "colors";
          symbol = "circle";
        }
        {
          key = " ";
          type = "custom";
        }
      ];
    };
  };
}
