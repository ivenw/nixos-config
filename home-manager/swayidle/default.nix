{config, ...}: {
  xdg.configFile."swayidle/config" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home-manager/swayidle/config";
  };
}
