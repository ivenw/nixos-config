{config, ...}: {
  programs.wezterm = {
    enable = true;
    # enableZshIntegration = true;
  };

  xdg.configFile."wezterm" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home-manager/wezterm";
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home-manager/nvim";
  };
}
