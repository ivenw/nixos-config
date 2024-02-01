{pkgs, ...}: {
  imports = [
    ./alacritty
    # ./dunst
    ./nvim
    ./git.nix
    ./gnome.nix
    ./starship.nix
    ./tmux
    # ./hyprland
    # ./waybar
    # ./swaylock
    # ./swayidle
    ./zellij
    ./zsh.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "ivenw";
    homeDirectory = "/home/ivenw";
    sessionPath = ["$HOME/.local/bin"];
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # cli and tui apps
    atuin
    bat
    gh
    azure-cli
    pipx
    terraform
    terramate
    fd
    fzf
    delta
    tokei
    ripgrep
    tree
    helix
    zoxide
    mdbook
    unzip
    yazi

    # linters and formatters
    alejandra
    stylua
    sqlfluff
    ruff

    # gui apps
    chromium
    discord
    _1password-gui
    # vial
    font-manager
    # blueman
    # gnome.nautilus
    # networkmanagerapplet

    # fonts
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
