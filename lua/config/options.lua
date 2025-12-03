-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.wildmenu = true
vim.o.wildmode = "full"

-- Disable copy to clipboard
vim.o.clipboard = ""
vim.o.laststatus = 2

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Floaterm
vim.g.floaterm_keymap_toggle = "<C-'>"
vim.g.floaterm_keymap_prev = "<C-p>"
vim.g.floaterm_keymap_next = "<C-n>"
vim.g.floaterm_keymap_new = "<C-t>"
vim.g.floaterm_keymap_hide = "<ESC><ESC>"
vim.g.floaterm_autoclose = 2
vim.g.floaterm_titleposition = "left"
