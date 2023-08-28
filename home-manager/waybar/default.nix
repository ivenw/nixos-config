{config, ...}: {
  rograms.waybar = {
    enabled = true;
  };

  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home-manager/waybar";
  };
}
