{config, ...}: {
  programs.lazygit = {
    enable = true;
  };

  xdg.configFile."lazygit/config.yml" = {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nixos-config/home-manager/lazygit/config.yml";
  };
}
