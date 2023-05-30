vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
  end,
})

vim.cmd([[
  highlight BookmarkSign ctermbg=NONE ctermfg=1
  highlight BookmarkLine ctermbg=1 ctermfg=NONE
  let g:bookmark_sign = '♥'
  let g:bookmark_highlight_lines = 1
]])
