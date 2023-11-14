{pkgs, ...}: {
  imports = [
    ./alacritty
    ./dunst
    ./nvim
    ./git.nix
    ./starship.nix
    ./tmux
    ./hyprland
    ./waybar
    ./swaylock
    ./swayidle
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

  # home.nix
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = ["blue"];
        size = "compact";
        # tweaks = ["rimless" "black"];
      };
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
    # font = {
    #   name = "JetBrainsMono Nerd Font";
    # };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.packages = with pkgs; [
    # cli and tui apps
    atuin
    bat
    gh
    azure-cli
    terraform
    terramate
    pulumi
    pulumiPackages.pulumi-language-nodejs
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
    mdbook
    unzip
    yazi

    # linters and formatters
    alejandra
    stylua
    black
    ruff
    sqlfluff

    # gui apps
    chromium
    discord
    _1password-gui
    obsidian
    vial
    font-manager
    blueman
    gnome.nautilus
    networkmanagerapplet

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
