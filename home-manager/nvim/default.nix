{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      # treesitter
      gcc
      nodejs_18

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
    source = config.lib.file.mkOutOfStoreSymlink ./.;
    recursive = true;
  };
}
