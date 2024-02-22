{config, ...}: {
  programs.git = {
    enable = true;
  };

  xdg.configFile."git/delta" = {
    source = fetchGit {
      url = "https://github.com/catppuccin/delta.git";
      rev = "21b37ac3138268d92cee71dfc8539d134817580a";
    };
  };

  xdg.configFile."git/config" = {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nixos-config/home-manager/git/config";
  };
}
