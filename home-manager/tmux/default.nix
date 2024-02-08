{
  pkgs,
  config,
  ...
}: {
  programs.tmux = {
    enable = true;
  };

  xdg.configFile."tmux/plugins/tpm" = {
    source = pkgs.fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tpm";
      rev = "v3.1.0";
      hash = "sha256-CeI9Wq6tHqV68woE11lIY4cLoNY8XWyXyMHTDmFKJKI=";
    };
  };

  xdg.configFile."tmux/tmux.conf" = {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nixos-config/home-manager/tmux/tmux.conf";
  };
}
