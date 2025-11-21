return {
  -- your other plugins here
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional but recommended
    config = function()
      require("fzf-lua").setup({
        files = {
          rg_opts = "--hidden --glob '!.git/*'",
        },
      })
    end,
  },
}
