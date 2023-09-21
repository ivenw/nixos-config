return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "dev-v3",
		init = function()
			local lsp = require("lsp-zero").preset({})
			lsp.extend_lspconfig()
			lsp.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp.default_keymaps({ buffer = bufnr })
			end)
			lsp.extend_cmp()
			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
			require("lspconfig").rust_analyzer.setup({
				on_init = function(client)
					client.config.settings = {
						["rust-analyzer"] = {
							checkOnSave = {
								command = "clippy",
							},
						},
					}
				end,
			})

			lsp.setup_servers({
				"nil_ls",
				"ruff_lsp",
				"pyright",
				"efm",
				"zls",
				"terraformls",
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
		"creativenull/efmls-configs-nvim",
		-- "ivenw/efmls-configs-nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			local prettier = require("efmls-configs.formatters.prettier")
			local lua = require("efmls-configs.formatters.stylua")
			local python = require("efmls-configs.formatters.black")
			local nix = require("efmls-configs.formatters.alejandra")
			local rust = require("efmls-configs.formatters.rustfmt")
			local terraform = require("efmls-configs.formatters.terraform_fmt")
			local languages = {
				lua = { lua },
				python = { python },
				nix = { nix },
				rust = { rust },
				css = { prettier },
				json = { prettier },
				html = { prettier },
				handlebars = { prettier },
				terraform = { terraform },
			}
			local config = {
				filetypes = vim.tbl_keys(languages),
				settings = {
					-- rootMarkers = { ".git/" },
					languages = languages,
				},
				init_options = {
					documentFormatting = true,
					documentRangeFormatting = true,
				},
			}
			require("lspconfig").efm.setup(vim.tbl_extend("force", config, {}))
		end,
	},
}
