return {
	-- "tpope/vim-sleuth",

	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "lukas-reineke/indent-blankline.nvim", opts = {} },
	{ "numToStr/Comment.nvim", opts = {} },
	{ "nvim-lualine/lualine.nvim", opts = {} },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
	{
		"ggandor/leap.nvim",
		dependencies = "tpope/vim-repeat",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
}
