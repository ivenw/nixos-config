{config, ...}: {
  programs.alacritty = {
    enable = true;
  };

  xdg.configFile."alacritty/themes/catppuccin" = {
    source = fetchGit {
      url = "https://github.com/catppuccin/alacritty.git";
      rev = "f2da554ee63690712274971dd9ce0217895f5ee0";
    };
  };

  xdg.configFile."alacritty/alacritty.toml" = {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nixos-config/home-manager/alacritty/alacritty.toml";
  };
}
