-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.cmd("inoremap jj <Esc>")

vim.opt.colorcolumn = "120"

vim.opt.autowrite = true

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

-- Keep undo history between nvim sessions
vim.opt.undofile = true

-- Always show sign column
vim.opt.signcolumn = "yes"

-- Sets how nvim show blank characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "_" }

-- Minimum number of line to show above and below current line
vim.opt.scrolloff = 10

-- show relative line numbers
vim.opt.relativenumber = true
