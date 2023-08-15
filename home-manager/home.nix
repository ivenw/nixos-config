# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, pkgs-unstable, nix-colors, ... }: {
  # You can import other home-manager modules here
  imports = [
    nix-colors.homeManagerModules.default
    ./test.nix
    # ./alacritty.nix
    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  colorScheme = nix-colors.colorSchemes.dracula;
  # colorScheme = nix-colors.colorSchemes.selenized-dark;

  nixpkgs = {
    config = {
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
    rnix-lsp

    # gui apps
    chromium
    _1password-gui
    obsidian

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
