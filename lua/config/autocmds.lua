-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Close nvim if the only window left is the file tree
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  desc = "1. Close one Nvim Tree, 2. Disable New Line Comment",
  callback = function()
    if #vim.api.nvim_list_wins() == 1 then
      local buf = vim.api.nvim_get_current_buf()
      local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
      if ft == "NvimTree" then
        vim.cmd("quit")
      end
    end
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Open terminal in insert mode
vim.api.nvim_command("augroup terminal_setup | au!")
vim.api.nvim_command("autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i")
vim.api.nvim_command("augroup end")
