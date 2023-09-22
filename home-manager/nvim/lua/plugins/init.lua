return {
	-- "tpope/vim-sleuth",

	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "lukas-reineke/indent-blankline.nvim", opts = {} },
	-- { "numToStr/Comment.nvim", opts = {} },
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				section_separators = { left = "", right = "" },
				component_separators = { left = "|", right = "|" },
			},
		},
	},
	-- {
	-- 	"windwp/nvim-autopairs",
	-- 	event = "InsertEnter",
	-- 	opts = {},
	-- },
	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	-- 	opts = {},
	-- },
	{
		"ggandor/leap.nvim",
		dependencies = "tpope/vim-repeat",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		{
			"echasnovski/mini.nvim",
			version = false,
			config = function()
				require("mini.comment").setup({})
				require("mini.pairs").setup({})
				require("mini.surround").setup({})
				-- require("mini.jump2d").setup({})
				local minimap = require("mini.map")
				minimap.setup({
					integrations = {
						minimap.gen_integration.builtin_search(),
						minimap.gen_integration.gitsigns(),
						minimap.gen_integration.diagnostic(),
					},
					symbols = { encode = minimap.gen_encode_symbols.dot("3x2") },
					window = { show_integration_count = false },
				})
				local miniclue = require("mini.clue")
				miniclue.setup({
					triggers = {
						-- Leader triggers
						{ mode = "n", keys = "<Leader>" },
						{ mode = "x", keys = "<Leader>" },

						-- Built-in completion
						{ mode = "i", keys = "<C-x>" },

						-- `g` key
						{ mode = "n", keys = "g" },
						{ mode = "x", keys = "g" },

						-- 's' key
						{ mode = "n", keys = "s" },
						{ mode = "x", keys = "s" },

						-- Marks
						{ mode = "n", keys = "'" },
						{ mode = "n", keys = "`" },
						{ mode = "x", keys = "'" },
						{ mode = "x", keys = "`" },

						-- Registers
						{ mode = "n", keys = '"' },
						{ mode = "x", keys = '"' },
						{ mode = "i", keys = "<C-r>" },
						{ mode = "c", keys = "<C-r>" },

						-- Window commands
						{ mode = "n", keys = "<C-w>" },

						-- `z` key
						{ mode = "n", keys = "z" },
						{ mode = "x", keys = "z" },
					},

					clues = {
						-- Enhance this by adding descriptions for <Leader> mapping groups
						miniclue.gen_clues.builtin_completion(),
						miniclue.gen_clues.g(),
						miniclue.gen_clues.marks(),
						miniclue.gen_clues.registers(),
						miniclue.gen_clues.windows(),
						miniclue.gen_clues.z(),
					},
					window = { delay = 0, config = { width = "auto" } },
				})
			end,
		},
	},
}
