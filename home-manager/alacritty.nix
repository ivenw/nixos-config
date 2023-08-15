{
  config
  , ... 
}: { programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        # size = 14;
        normal.family = "JetBrainsMono Nerd Font";
      };
      window.padding = { x = 5; y = 5; };
      colors = let colors = config.colorScheme.colors; in
        {
          primary.background = "#${colors.base00}";
          primary.foreground = "#${colors.base05}";
          normal.black = "#${colors.base01}";
          normal.red = "#${colors.base08}";
          normal.green = "#${colors.base0B}";
          normal.yellow = "#${colors.base0A}";
          normal.blue = "#${colors.base0D}";
          normal.magenta = "#${colors.base0E}";
          normal.cyan = "#${colors.base0C}";
          normal.white = "#${colors.base05}";
        };
    };
  };
}
