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
map("n", "<leader>wt", ":tab split<CR>", { desc = "Move buffer to new window" }) -- move buffer to new window
-- Tree
map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>ef", ":NvimTreeFocus<CR>")
map("n", "<leader>en", ":NvimTreeFindFile<CR>", { desc = "Reveal file in tree" })

-- Restore Vim-style <C-r> register paste in insert mode
map("i", "<C-r>", "<C-r>", { noremap = true })

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

-- Disable default f/F motion behavior
-- map({ "n", "x", "o" }, "f", "<Nop>")
-- map({ "n", "x", "o" }, "F", "<Nop>")
-- Remap f → Flash jump (like LazyVim's "s")
map({ "n", "x", "o" }, "F", function()
  require("flash").jump()
end, { desc = "Flash Jump" })
-- Optionally: F → Flash Treesitter jump
-- map({ "n", "x", "o" }, "F", function()
--   require("flash").treesitter()
-- end, { desc = "Flash Treesitter Jump" })

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

-- Window jump
map("n", "<Left>", "<C-w>h")
-- map("n", "<Down>", "<C-w>j")
-- map("n", "<Up>", "<C-w>k")
map("n", "<Right>", "<C-w>l")
map("n", "<C-w>m", "<leader>wm")

-- Floaterm
map("n", "<C-_>", ":FloatermToggle<CR>")
map("t", "<C-_>", "<C-\\><C-n>:FloatermToggle<CR>")
map("n", "<C-/>", ":FloatermToggle<CR>")
map("t", "<C-/>", "<C-\\><C-n>:FloatermToggle<CR>")

-- Function
map("n", "<C-9>", "[m")
map("n", "<C-0>", "]m")

-- Terminal
-- map("n", "<c-\\>", function()
--   Snacks.terminal(nil, { cwd = LazyVim.root() })
-- end, { desc = "which_key_ignore" })
-- map("t", "<c-\\>", "<cmd>close<cr>", { desc = "which_key_ignore" })

map("i", "<C-D>", "<Del>", { noremap = true, silent = true })

-- Debugger
local dap = require("dap")
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })
vim.keymap.set("n", "<leader>dg", dap.step_over, { desc = "DAP Step Over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP Step Into" })
vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "DAP Step Out" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })

vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional Breakpoint" })

vim.keymap.set("n", "<leader>dq", function()
  local dapui = require("dapui")

  dap.terminate()
  dap.disconnect({ terminateDebuggee = true })

  dapui.close()

  -- optional cleanup of stale state
  require("dap.repl").close()
end, { desc = "Stop Debugging (full cleanup)" })
