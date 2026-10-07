return {
  "joryeugene/dadbod-grip.nvim",

  opts = {
    -- limit = 100,
    -- timeout = 10000,
    -- completion = true,
    open_sidebar = true,
  },

  keys = {
    { "<leader>Gb", "<cmd>GripConnect<cr>", desc = "Database connections" },
    { "<leader>Gh", "<cmd>GripHistory<cr>", desc = "Query History" },
  },
}
