return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        false,
      },
      {
        "f",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        false,
        -- function()
        --   require("flash").treesitter()
        -- end,
        -- desc = "Flash Treesitter",
      },
      {
        "r",
        false,
      },
      {
        "R",
        false,
      },
      {
        "<c-s>",
        false,
      },
    },
  },
}
