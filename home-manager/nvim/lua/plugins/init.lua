return {
	-- "tpope/vim-sleuth",

	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "lukas-reineke/indent-blankline.nvim", opts = {} },
	{
		"numToStr/Comment.nvim",
		opts = {},
		config = function()
			require("Comment").setup()
		end,
	},
	{ "nvim-lualine/lualine.nvim", opts = {} },
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
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
