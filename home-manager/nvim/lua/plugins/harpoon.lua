return {
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
		km.set("n", "<leader>hf", function()
			require("harpoon.ui").nav_file(1)
		end, { desc = "Go to file #1" })
		km.set("n", "<leader>hp", function()
			require("harpoon.ui").nav_file(2)
		end, { desc = "Go to file #2" })
		km.set("n", "<leader>hs", function()
			require("harpoon.ui").nav_file(3)
		end, { desc = "Go to file #3" })
		km.set("n", "<leader>ht", function()
			require("harpoon.ui").nav_file(4)
		end, { desc = "Go to file #4" })
	end,
}
