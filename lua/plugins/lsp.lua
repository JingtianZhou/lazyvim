return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          -- Change an existing keymap
          { "K", "10k", mode = "n", desc = "Move up 10 lines" },
          { "gh", vim.lsp.buf.hover, desc = "Hover Documentation" },
        },
      },
      -- Lua
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      },

      -- Python
      pyright = {},

      -- C / C++
      clangd = {},
    },
  },
}
