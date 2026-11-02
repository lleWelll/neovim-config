return {
  "folke/snacks.nvim",
  -- off snacks picker keymaps, that conflicting with lua/plugins/telescope.lua
  keys = {
    { "<leader>fg", false },
    { "<leader>ff", false },
    { "<leader>fb", false },
  },
  opts = {
    scroll = {
      enabled = true,
      animate = {
        duration = {
          step = 10,
          total = 350,
        },
        easing = "linear",
      },
    },
    picker = {
      icons = {
        git = {
          staged = "S",
          added = "A",
          deleted = "D",
          ignored = "",
          modified = "M",
          renamed = "R",
          untracked = "U",
        },
      },
    },
  },
}
