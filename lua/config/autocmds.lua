-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  pattern = "*",
  command = "silent! wa",
})

vim.api.nvim_create_autocmd({ "BufEnter", "LspAttach" }, {
  pattern = "*.java",
  callback = function(event)
    local bufnr = event.buf

    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(bufnr) then
        vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
      end
    end)
  end,
})

-- ColorScheme override
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  pattern = "*",
  callback = function()
    -- Explorer (snacks.Picker, NeoTree)
    vim.api.nvim_set_hl(0, "SnacksPicker", { link = "SnacksPicker" })
    vim.api.nvim_set_hl(0, "SnacksPickerTree", { link = "SnacksPicker" })
    vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "SnacksPicker" })
    vim.api.nvim_set_hl(0, "SnacksPickerDirectory", { link = "SnacksPicker" })
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { link = "SnacksPicker" })
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { link = "SnacksPicker" })
    vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { bold = true, fg = "#CD0300", italic = true })

    -- MiniIcons
    vim.api.nvim_set_hl(0, "MiniIconsBlue", { fg = "#82AAFF" })

    -- Git
    vim.api.nvim_set_hl(0, "GitGutterAdd", { fg = "#125F07" })
    vim.api.nvim_set_hl(0, "GitGutterChange", { fg = "#2E59D7" })
    vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#450C0F" })
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#0C4532" })

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

    for _, g in ipairs({
      "Normal",
      "NormalNC",
      "NormalFloat",
      "FloatBorder",
      "SignColumn",
      "EndOfBuffer",
      "LineNr",
      "FoldColumn",
      "WinSeparator",
      "SnacksPicker",
      "SnacksPickerBorder",
      "NeoTreeNormal",
      "NeoTreeNormalNC",
    }) do
      vim.api.nvim_set_hl(0, g, { bg = "none" })
    end
    vim.api.nvim_set_hl(0, "@lsp.typemod.method.definition.go", { link = "TSMethod" })
  end,
})
