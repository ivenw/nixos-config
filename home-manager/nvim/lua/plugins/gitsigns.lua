return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup()

		local km = vim.keymap

		km.set("n", "<leader>cb", gitsigns.toggle_current_line_blame, { desc = "Toggle blame" })
	end,
}
