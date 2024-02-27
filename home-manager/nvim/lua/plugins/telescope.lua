return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<esc>"] = require("telescope.actions").close,
							["<C-h>"] = "which_key",
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")

			local km = vim.keymap
			km.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find file" })
			km.set("n", "<leader>tb", "<cmd>Telescope buffers<cr>", { desc = "Search buffers" })
			km.set("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", { desc = "Grep search" })
			km.set("n", "<leader>td", "<cmd>Telescope lsp_definitions<cr>", { desc = "Show definitions" })
			km.set("n", "<leader>tr", "<cmd>Telescope lsp_references<cr>", { desc = "Show references" })
		end,
	},
}
