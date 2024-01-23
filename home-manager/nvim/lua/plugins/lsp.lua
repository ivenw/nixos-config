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
				"gopls",
				"terraformls",
				"tflint",
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
			local prettier = require("efmls-configs.formatters.prettier")
			local stylua = require("efmls-configs.formatters.stylua")
			-- local black = require("efmls-configs.formatters.black")
			local ruff = require("efmls-configs.formatters.ruff")
			local alejandra = require("efmls-configs.formatters.alejandra")
			local rustfmt = require("efmls-configs.formatters.rustfmt")
			local gofmt = require("efmls-configs.formatters.gofmt")
			local terraformfmt = require("efmls-configs.formatters.terraform_fmt")
			local terramatefmt = require("efmls-configs.formatters.terramate_fmt")
			local yamllint = require("efmls-configs.linters.yamllint")

			local languages = {
				lua = { stylua },
				-- python = { black },
				-- python = { ruff },
				nix = { alejandra },
				rust = { rustfmt },
				go = { gofmt },
				css = { prettier },
				json = { prettier },
				yaml = { yamllint, prettier },
				html = { prettier },
				handlebars = { prettier },
				terraform = { terraformfmt },
				hcl = { terramatefmt },
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
