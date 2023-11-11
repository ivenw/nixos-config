local km = vim.keymap

-- Don't yank when single deleting
km.set("n", "x", '"_x')

-- Improve scrolling
km.set("n", "<C-u>", "<C-u>zz")
km.set("n", "<C-d>", "<C-d>zz")

-- Easy access to commands
km.set("n", "<leader><leader>", ":", { desc = "Open command line" })
km.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
km.set("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" })

-- Clear search
km.set("n", "<leader>cs", ':let @/ = ""<CR>', { desc = "Clear search" })

-- unbind search
km.set("n", "n", "")

-- Split management
km.set("n", "<leader>pn", ":vnew<CR>", { desc = "New pane" })
km.set("n", "<leader>px", ":close<CR>", { desc = "Close pane" })

-- Tab managment
-- km.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
-- km.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
-- km.set("n", "K", ":tabnext<CR>")
-- km.set("n", "J", ":tabpreviors<CR>")

-- rename
km.set("n", "<leader>R", function()
	local current_word = vim.fn.expand("<cword>")
	vim.ui.input({ prompt = "Replace: ", default = current_word }, function(input)
		if input == nil then
			return
		end
		vim.cmd("%s/" .. current_word .. "/" .. input .. "/g")
	end)
end)

-- LSP
km.set("n", "<leader>i", vim.lsp.buf.hover, { desc = "Symbol info" })
km.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
km.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostics info" })

-- Telescope
km.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find file" })
km.set("n", "<leader>tb", "<cmd>Telescope buffers<cr>", { desc = "Search buffers" })
km.set("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", { desc = "Grep saerch" })
km.set("n", "<leader>td", "<cmd>Telescope lsp_definitions<cr>", { desc = "Show definitions" })
km.set("n", "<leader>tr", "<cmd>Telescope lsp_references<cr>", { desc = "Show references" })
km.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
