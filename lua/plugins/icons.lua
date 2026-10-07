return {
  {
    "nvim-mini/mini.icons",
    opts = {
      file = {

        ["go.mod"] = { glyph = "", hl = "MiniIconsBlue" },
        ["go.sum"] = { glyph = "", hl = "MiniIconsRed" },
        ["dockerfile"] = { glyph = "", hl = "MiniIconsBlue" },
        ["Dockerfile"] = { glyph = "", hl = "MiniIconsBlue" },
        ["application.yml"] = { glyph = "󰌪", hl = "MiniIconsGreen" },
      },

      extension = {
        sql = { glyph = "󰆼", hl = "MiniIconsGreen" },
      },

      filetype = {
        java = { glyph = "", hl = "MiniIconsRed" },
        go = { glyph = "", hl = "MiniIconsCyan" },
        rc = { glyph = "", hl = "MiniIconsPurple" },
      },

      -- fallback when nothing matches
      default = {
        default = { glyph = "󰟢", hl = "MiniIconsGrey" },
        directory = { glyph = "󰉋", hl = "MiniIconsGrey" },
        extension = { glyph = "󰈔", hl = "MiniIconsGrey" },
        file = { glyph = "󰈔", hl = "MiniIconsGrey" },
        filetype = { glyph = "󰈔", hl = "MiniIconsGrey" },
        lsp = { glyph = "󰞋", hl = "MiniIconsRed" },
        os = { glyph = "󰟀", hl = "MiniIconsPurple" },
      },

      -- uncomment if glyphs render as boxes in your terminal font
      -- style = "ascii",
    },
  },
}
