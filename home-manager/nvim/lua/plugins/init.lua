return {
	-- "tpope/vim-sleuth",

	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "lukas-reineke/indent-blankline.nvim", opts = {} },
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				section_separators = { left = "", right = "" },
				component_separators = { left = "|", right = "|" },
			},
		},
	},
	{
		"ggandor/leap.nvim",
		dependencies = "tpope/vim-repeat",
		config = function()
			local km = vim.keymap
			require("leap").setup({
				km.set({ "n", "x", "o" }, "f", "<Plug>(leap-forward-to)"),
				km.set({ "n", "x", "o" }, "F", "<Plug>(leap-backward-to)"),
			})
		end,
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			local km = vim.keymap
			km.set("n", "<leader>hh", function()
				require("harpoon.ui").toggle_quick_menu()
			end, { desc = "Harpoon menu" })
			km.set("n", "<leader>ha", function()
				require("harpoon.mark").add_file()
			end, { desc = "Add file to harpoon" })
			km.set("n", "<leader>ht", function()
				require("harpoon.ui").nav_file(1)
			end, { desc = "Go to file #1" })
			km.set("n", "<leader>hs", function()
				require("harpoon.ui").nav_file(2)
			end, { desc = "Go to file #2" })
			km.set("n", "<leader>hr", function()
				require("harpoon.ui").nav_file(3)
			end, { desc = "Go to file #3" })
			km.set("n", "<leader>ha", function()
				require("harpoon.ui").nav_file(4)
			end, { desc = "Go to file #4" })
		end,
	},
}
