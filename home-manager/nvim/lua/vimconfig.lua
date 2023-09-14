local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable true colors
opt.termguicolors = true

-- line numbers
opt.number = true
opt.relativenumber = true

-- cursorline
opt.cursorline = true

-- tab settings
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- saving settings
opt.swapfile = false
opt.backup = false

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- scroll settings
opt.scrolloff = 8

-- shorten timeoutlen
opt.timeoutlen = 500
