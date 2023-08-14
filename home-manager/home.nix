# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, pkgs-unstable, nix-colors, ... }: {
  # You can import other home-manager modules here
  imports = [
    nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  colorScheme = nix-colors.colorSchemes.selenized-dark;

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };


  home = {
    username = "ivenw";
    homeDirectory = "/home/ivenw";
  };


  fonts.fontconfig.enable = true;

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    # cli and tui apps 
    gh
    azure-cli
    bat
    exa
    delta
    tokei
    ripgrep
    tree
    lf
    pkgs-unstable.helix
    pkgs-unstable.neovim

    # Nix
    nixpkgs-fmt
    rnix-lsp

    # gui apps
    chromium
    _1password-gui
    pkgs-unstable.obsidian

    # fonts
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];


  # Enable home-manager 
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config";
      update = "home-manager switch --flake ~/nixos-config";
      cleanup = "sudo nix profile wipe-history";
    };
    oh-my-zsh = {
      enable = true;
    };
  };


  programs.git = {
    enable = true;
    userName = "Iven Winkelmann";
    userEmail = "winkelmann.iven@gmail.com";
    aliases = {
      s = "status";
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        # size = 14;
        normal.family = "JetBrainsMono Nerd Font";
      };
      window.padding = { x = 5; y = 0; };
      colors = let colors = config.colorScheme.colors; in
        {
          primary.background = "#${colors.base00}";
          primary.foreground = "#${colors.base05}";
        };
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      aws.disabled = true;
      package.disabled = true;
    };
  };

  programs.zellij = {
    enable = true;
  };

  programs.vscode = {
    enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
