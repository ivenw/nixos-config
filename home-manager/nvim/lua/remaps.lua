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

-- Split management
km.set("n", "<leader>pn", ":vnew<CR>", { desc = "New pane" })
km.set("n", "<leader>px", ":close<CR>", { desc = "Close pane" })

-- Tab managment
-- km.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
-- km.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
-- km.set("n", "K", ":tabnext<CR>")
-- km.set("n", "J", ":tabprevious<CR>")

-- LSP
km.set("n", "<leader>i", vim.lsp.buf.hover, { desc = "Symbol info" })

-- Telescope
km.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find file" })
km.set("n", "<leader>t", "<cmd>Telescope treesitter<cr>", { desc = "Search tree" })
km.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Search tree" })
km.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>", { desc = "Search tree" })
