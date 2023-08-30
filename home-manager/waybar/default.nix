{config, ...}: {
  xdg.configFile.waybar = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home-manager/waybar";
  };
}
