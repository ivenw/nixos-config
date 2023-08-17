{
  inputs,
  lib,
  config,
  pkgs,
  nix-colors,
  ...
}: {
  imports = [
    ./alacritty
    ./nvim
    ./git.nix
    ./starship.nix
    ./zellij.nix
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
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # cli and tui apps
    gh
    # azure-cli
    bat
    exa

    delta
    tokei
    ripgrep
    tree
    lf
    helix

    # Nix
    nixpkgs-fmt
    alejandra
    nil
    rnix-lsp

    # gui apps
    chromium
    _1password-gui
    obsidian

    # fonts
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  programs.vscode = {
    enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
