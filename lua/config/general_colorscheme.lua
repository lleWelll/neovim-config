local M = {}

function M.apply()
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
    -- Убираем только фон, сохраняя fg/bold и прочие атрибуты схемы
    local hl = vim.api.nvim_get_hl(0, { name = g, link = false })
    hl.bg = nil
    hl.ctermbg = nil
    vim.api.nvim_set_hl(0, g, hl)
  end
end

return M
