-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
-- 1. БАЗОВЫЙ СИНТАКСИС
--    vim.keymap.set(mode, lhs, rhs, opts)
--      mode — режим (см. список выше), можно строку "n" или список { "n", "v" }
--      lhs  — комбинация клавиш, которую нажимаем (например "<leader>ff")
--      rhs  — что произойдёт (команда-строка или Lua-функция)
--      opts — таблица опций { desc = "...", silent = true }
--
-- 2. РЕЖИМЫ
-- "n"	Normal
-- "i"	Insert
-- "v"	Visual / Select
-- "x"	Visual only
-- "c"	Command-line
-- "t"	Terminal
-- "o"	Operator-pending
--
-- 3. rhs
-- "<cmd>...<CR>"    Ex-команда
-- "<CR>"            Enter
-- <C-x>             Ctrl + x
-- <S-x>             Shift + x
-- <A-x>             Alt + x
-- <D-x>             Command + x на macOS
--
-- 4. ОПЦИИ (opts):
--       desc    — подсказка, ВАЖНО: which-key показывает её в меню <leader>
--       silent  — не печатать команду в командной строке (true рекомендуется)
--       noremap — не разворачивать rhs через другие мапы (по умолчанию true)
--       remap

-- buffer
vim.keymap.set("n", "<A-w>", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Telescope
vim.keymap.set(
  "n",
  "<leader>fl",
  "<cmd>Telescope lsp_workspace_symbols<CR>",
  { desc = "Telescope lsp_workspace_symbols" }
)
vim.keymap.set("n", "<leader>sf", "<leader>ff", { remap = true, desc = "Telescope find files (alias to <leader>ff)" })

-- resize window
vim.keymap.set("n", "<C-A-Up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-A-Down>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-A-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-A-Right>", "<cmd>vertical resize +2<cr>")

vim.keymap.set("n", "<leader>fG", LazyVim.pick.config_files(), { desc = "Find config files" })
vim.keymap.set("n", "<leader>fc", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify(path, vim.log.levels.INFO, { title = "Copied" })
  -- vim.fn.setreg("+", vim.fn.expand("%:p"))
  -- vim.fn.execute("echo 'Copied'")
end, { remap = true, desc = "Copy current file path" })
vim.keymap.set("n", "<leader>fC", function()
  local path = vim.fn.expand("%:p") -- путь
  local line = vim.fn.line(".") -- текущая строка курсора

  local location = path .. ":" .. line

  vim.fn.setreg("+", location) -- системный clipboard
  vim.notify("Copied: " .. location)
end, { desc = "Copy file path with line number" })
