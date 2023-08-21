return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					keymap = { accept_line = "<C-l>", accept_block = "<C-h>" },
				},
			})
		end,
	},
}
