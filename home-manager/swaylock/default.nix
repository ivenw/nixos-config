{config, ...}: {
  xdg.configFile."swaylock/config" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home-manager/swaylock/config";
  };
}
