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

      # Rust
      rust-analyzer

      # Python
      nodePackages.pyright
      ruff-lsp
      black

      # Lua
      lua-language-server
      stylua
    ];
  };

  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home-manager/nvim";
  };
}
