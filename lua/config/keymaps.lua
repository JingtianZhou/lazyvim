-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del

-- Remove <leader><leader> default file search
unmap("n", "<leader><space>", { desc = "Find Files (root dir)" })

map("n", "<leader>q", ":q!<cr>")
map("n", "<leader>y", '"+y', { desc = "Copy line/selection to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Copy line/selection to system clipboard" })

-- window management
-- map("n", "<leader>ss", "<C-w>s") -- new split
-- map("n", "<leader>sv", "<C-w>v") -- new vertical split
map("n", "<leader>wt", ":tab split<CR>", { desc = "Move buffer to new window" }) -- move buffer to new window
-- Tree
map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>nf", ":NvimTreeFindFile<CR>", { desc = "Reveal file in tree" })

-- number increasing
map("n", "_", "<C-x>")
map("v", "_", "<C-x>")
map("n", "+", "<C-a>")

map("v", "+", "<C-a>")
-- Jump to head and tail of a line
map("i", "<C-a>", "<ESC>I")
map("i", "<C-e>", "<ESC>A")
map("n", "<C-a>", "^")
map("n", "<C-e>", "$")

-- switch buffer
-- map("n", "[", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- map("n", "]", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Disable default f/F motion behavior
map({ "n", "x", "o" }, "f", "<Nop>")
map({ "n", "x", "o" }, "F", "<Nop>")
-- Remap f → Flash jump (like LazyVim's "s")
map({ "n", "x", "o" }, "f", function()
  require("flash").jump()
end, { desc = "Flash Jump" })
-- Optionally: F → Flash Treesitter jump
map({ "n", "x", "o" }, "F", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter Jump" })

-- no highlight
map("n", "<leader>nh", ":nohl<CR>")

map("n", "<leader>j", "J")
map("n", "J", "10j")
map("n", "K", "10k")

-- resize
map("n", "<C-down>", ":resize +20<CR>")
map("n", "<C-up>", ":resize -20<CR>")
map("n", "<C-Left>", ":vertical resize -10<CR>")
map("n", "<C-Right>", ":vertical resize +10<CR>")

-- Backspace
map("i", "<C-BS>", "<C-w>")

-- Floaterm
map("n", "<C-/>", ":FloatermToggle<CR>")
map("t", "<C-/>", "<C-\\><C-n>:FloatermToggle<CR>")

--terminal
map("n", "<c-\\>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "which_key_ignore" })
map("t", "<c-\\>", "<cmd>close<cr>", { desc = "which_key_ignore" })

map("i", "<C-D>", "<Del>", { noremap = true, silent = true })
