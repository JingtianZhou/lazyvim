return {
  "akinsho/toggleterm.nvim",
  enabled = false,
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-\>]],
      start_in_insert = true,
      persist_mode = true,
      direction = "horizontal",
      close_on_exit = true,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
        title_pos = "center",
      },
    })

    ---------------------------------------------------------------------
    -- Terminal-mode keymaps (for ALL toggleterm terminals)
    ---------------------------------------------------------------------
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
      vim.keymap.set("t", "<C-w>l", [[<Cmd>wincmd l<CR>a]], opts)
      vim.keymap.set("t", "<C-w>h", [[<Cmd>wincmd h<CR>a]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
  end,
}
