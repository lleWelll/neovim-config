return {
  {
    "xiantang/darcula-dark.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("darcula").setup(opts)

      local function apply_highlights()
        -- Semantic tokens
        vim.api.nvim_set_hl(0, "TSMethod", { fg = "#FFC66D" }) -- объявление метода
        vim.api.nvim_set_hl(0, "TSMethodCall", { fg = "#CDCCCC" }) -- вызов метода
        vim.api.nvim_set_hl(0, "TSType", { fg = "#AE90F3" })
        vim.api.nvim_set_hl(0, "TSVariable", { fg = "#67B6FF" })
        vim.api.nvim_set_hl(0, "TSField", { fg = "#9876AA" })

        -- Java
        vim.api.nvim_set_hl(0, "@lsp.type.method.java", { link = "TSMethodCall" })
        vim.api.nvim_set_hl(0, "@lsp.typemod.method.declaration.java", { link = "TSMethod" })
        vim.api.nvim_set_hl(0, "@lsp.typemod.method.public.java", { bold = true })
        vim.api.nvim_set_hl(0, "@function.method.java", { link = "TSMethod" })
        vim.api.nvim_set_hl(0, "@function.method.call.java", { link = "TSMethodCall" })
        vim.api.nvim_set_hl(0, "@lsp.type.modifier.java", { link = "@keyword.modifier.java" })
        vim.api.nvim_set_hl(0, "@lsp.typemod.class.public.java", { link = "@type.java" })

        -- Go
        vim.api.nvim_set_hl(0, "@lsp.type.method.go", { link = "TSMethodCall" })
        vim.api.nvim_set_hl(0, "@lsp.typemod.method.definition.go", { link = "TSMethod" })

        local general_colorscheme = require("config.general_colorscheme")
        general_colorscheme.apply()
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "darcula-dark",
        group = vim.api.nvim_create_augroup("DarculaOverrides", { clear = true }),
        callback = apply_highlights,
      })

      -- На случай, если схема уже загружена к этому моменту
      if vim.g.colors_name == "darcula-dark" then
        apply_highlights()
      end
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "darcula-dark",
    },
  },
}
