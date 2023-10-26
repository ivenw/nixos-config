{config, ...}: {
  xdg.configFile."dunst/dunstrc" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home-manager/dunst/dunstrc";
  };
}
