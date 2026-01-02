return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    { "<C-8>", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    keymaps = {
      goto_and_close = "<o>",
    },
  },
}
