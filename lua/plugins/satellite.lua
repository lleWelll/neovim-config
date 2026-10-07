return {
  {
    "lewis6991/satellite.nvim",
    event = "VeryLazy",
    opts = {
      handlers = {
        gitsigns = {
          enable = true,
          signs = {
            add = "│",
            change = "│",
            delete = "-",
          },
        },
      },
    },
  },
}
