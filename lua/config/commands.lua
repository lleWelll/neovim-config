vim.cmd([[cnoreabbrev <expr> dd ((getcmdtype() == ':' && getcmdline() == 'dd') ? 'DB' : 'dd')]])
vim.cmd([[cnoreabbrev <expr> gg ((getcmdtype() == ':' && getcmdline() == 'gg') ? 'Grip' : 'gg')]])
