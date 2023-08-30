{pkgs, ...}: {
  imports = [
    ./alacritty
    ./nvim
    ./git.nix
    ./starship.nix
    ./tmux
    ./hyprland
    ./waybar
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
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # cli and tui apps
    atuin
    bat
    gh
    # azure-cli
    exa
    fd
    fzf
    delta
    tokei
    ripgrep
    tree
    lf
    nnn
    helix
    deno
    zoxide

    # linters and formatters
    alejandra
    stylua
    black
    ruff

    # gui apps
    chromium
    _1password-gui
    obsidian
    vscode
    vial
    font-manager
    blueman

    # volvo crap
    citrix_workspace

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
