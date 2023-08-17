{...}: {
  programs.alacritty = {
    enable = true;
  };

  xdg.configFile.alacritty = {
    source = ./.;
    recursive = true;
  };
}
