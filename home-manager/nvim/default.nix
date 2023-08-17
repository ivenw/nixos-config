{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      # treesitter
      gcc

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
}
