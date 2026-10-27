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

    -- Snacks dashboard text, icons and key hints
    for _, g in ipairs({
      "SnacksDashboardHeader",
      "SnacksDashboardIcon",
      "SnacksDashboardKey",
      "SnacksDashboardDesc",
      "SnacksDashboardFile",
      "SnacksDashboardDir",
      "SnacksDashboardFooter",
      "SnacksDashboardSpecial",
    }) do
      vim.api.nvim_set_hl(0, g, { fg = "#ADADAD" })
    end

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

-- `nvim .` leaves an empty [No Name] buffer behind the explorer; drop it once another buffer takes its window
vim.api.nvim_create_autocmd("BufHidden", {
  callback = function(args)
    local buf = args.buf
    if
      vim.api.nvim_buf_get_name(buf) == ""
      and vim.bo[buf].buftype == ""
      and not vim.bo[buf].modified
      and vim.api.nvim_buf_line_count(buf) == 1
      and vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] == ""
    then
      vim.schedule(function()
        if vim.api.nvim_buf_is_valid(buf) and #vim.fn.win_findbuf(buf) == 0 then
          vim.api.nvim_buf_delete(buf, {})
        end
      end)
    end
  end,
})

-- `nvim .`: show the snacks dashboard (welcome page) instead of the empty buffer next to the explorer
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() ~= 1 or vim.fn.isdirectory(vim.fn.argv(0)) == 0 then
      return
    end
    vim.defer_fn(function()
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        if
          vim.bo[buf].buftype == ""
          and vim.api.nvim_buf_get_name(buf) == ""
          and not vim.bo[buf].modified
          and vim.api.nvim_buf_line_count(buf) == 1
          and vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] == ""
        then
          require("snacks").dashboard.open({ win = win })
          return
        end
      end
    end, 100)
  end,
})
