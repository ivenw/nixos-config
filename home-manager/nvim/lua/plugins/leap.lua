return {
	"ggandor/leap.nvim",
	dependencies = "tpope/vim-repeat",
	config = function()
		local km = vim.keymap
		require("leap").setup({
			km.set({ "n", "x", "o" }, "f", "<Plug>(leap-forward-to)"),
			km.set({ "n", "x", "o" }, "F", "<Plug>(leap-backward-to)"),
		})
	end,
}

