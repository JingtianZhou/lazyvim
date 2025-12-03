return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  -- load it immediately (you can remove this if you want)
  lazy = false,

  config = function()
    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local nvimtree = require("nvim-tree")

    nvimtree.setup({
      view = {
        width = 50,
        relativenumber = true,
      },
      actions = {
        open_file = {
          window_picker = { enable = false },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
      },
      filters = {
        custom = { ".DS_Store" },
      },
      -- custom keymaps
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        -- default mappings
        api.config.mappings.default_on_attach(bufnr)
        -- your custom mappings
        vim.keymap.set("n", "H", api.tree.change_root_to_parent, opts("Up"))
        vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Mark"))
        vim.keymap.set("n", "v", api.node.open.vertical, opts("Open Vertical"))
        vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open Horizontal"))
        vim.keymap.set("n", "O", api.node.run.system, opts("Open with default opener"))
        vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
        vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("toggle hidden files"))
        vim.keymap.set("n", "l", api.node.open.edit, opts("open"))
        vim.keymap.set("n", "L", api.tree.change_root_to_node, opts("open"))
        vim.keymap.set("n", "p", api.node.open.preview, opts("preview"))

        -- Search with fzf-lua in tree
        vim.keymap.set("n", "f", function()
          local fzf = require("fzf-lua")
          fzf.fzf_exec("fd -H -t f -E '.git/'", {
            prompt = ":",
            fzf_opts = { ["--padding"] = "5%,5%,15%,5%" },
            winopts = {
              height = 0.15,
              width = vim.fn.winwidth(0) - 2,
              row = 1,
              col = 1,
              title = " search tree ",
            },
            actions = {
              ["default"] = {
                fn = function(selected)
                  api.tree.find_file(selected[1])
                end,
                desc = "fuzzy find in tree",
              },
            },
          })
        end, opts("fuzzy find in tree"))
      end,

      -- pass to setup along with your other options
      require("nvim-tree").setup({
        ---
        on_attach = my_on_attach,
        ---
      }),
    })
  end,
}
