return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      highlights = {
        buffer_selected = { fg = "#ffc24b", bold = true, italic = false }, -- active buffer name
        indicator_selected = { fg = "#ffc24b" }, -- the bar/underline next to the active buffer
        modified_selected = { fg = "#ff9e64" }, -- "●" shown on the active buffer when it has unsaved changes
      },
    },
  },
}
