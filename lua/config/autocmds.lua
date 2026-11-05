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
