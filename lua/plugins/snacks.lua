return {
  "folke/snacks.nvim",
  -- off snacks picker keymaps, that conflicting with lua/plugins/telescope.lua
  keys = {
    { "<leader>fg", false },
    { "<leader>ff", false },
    { "<leader>fb", false },
  },
  opts = {
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
