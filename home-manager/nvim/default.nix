{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    extraPackages = with pkgs; [
      # treesitter
      gcc
      nodejs_18
      tree-sitter

      # Linting & formatting lsp
      efm-langserver

      # Nix
      nil
      alejandra

      # terraform
      terraform-ls

      # zig
      zls

      # go
      gopls

      # Python
      nodePackages.pyright
      ruff-lsp
      black
      pylint

      # Lua
      lua-language-server
      stylua

      # YAML
      yamllint

      # Web
      nodePackages.prettier
    ];
  };

  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home-manager/nvim";
  };
}
