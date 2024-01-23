{config, ...}: {
  programs.alacritty = {
    enable = true;
  };

  # xdg.configFile.alacritty = {
  #   source = ./.;
  #   recursive = true;
  # };
  xdg.configFile.alacritty = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home-manager/alacritty";
  };
}
