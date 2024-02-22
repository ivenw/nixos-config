{...}: {
  programs.bat = {
    enable = true;
  };

  xdg.configFile."bat/themes" = {
    source = fetchGit {
      url = "https://github.com/catppuccin/bat";
      rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
    };
  };
}
