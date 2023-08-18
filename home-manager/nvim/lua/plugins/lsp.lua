return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "dev-v3",
		init = function()
			local lsp = require("lsp-zero").preset({})
			lsp.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp.default_keymaps({ buffer = bufnr })
			end)
			lsp.extend_cmp()
			-- (Optional) Configure lua language server for neovim
			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

			-- Replace the language servers listed here
			-- with the ones installed in your system
			lsp.setup_servers({
				"nil_ls",
				"rust_analyzer",
				"ruff_lsp",
				"efm",
			})
		end,
	},

	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
		},
	},
	-- Formatting
	{
		-- "creativenull/efmls-configs-nvim",
		"ivenw/efmls-configs-nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			local efmls = require("efmls-configs")
			efmls.init({
				-- Enable formatting provided by efm langserver
				init_options = {
					documentFormatting = true,
				},
			})
			efmls.setup({
				lua = { formatter = require("efmls-configs.formatters.stylua") },
				python = { formatter = require("efmls-configs.formatters.black") },
				nix = { formatter = require("efmls-configs.formatters.alejandra") },
			})
		end,
	},
}
