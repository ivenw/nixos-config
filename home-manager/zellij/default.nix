{...}: {
  programs.zellij = {
    enable = true;
  };

  xdg.configFile.zellij = {
    source = ./.;
    recursive = true;
  };
}
