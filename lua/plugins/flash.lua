return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, false },
      {
        "F",
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
