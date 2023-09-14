local M = {
  enabled = true,
  "MattesGroeger/vim-bookmarks",
  lazy = true,
  event = "BufRead",
  cmd = {
    "BookmarkToggle", "BookmarkAnnotate", "BookmarkShowAll", "BookmarkNext", "BookmarkPrev", "BookmarkClear",
    "BookmarkClearAll", "BookmarkMoveToLine",
  },
  keys = {
    { "<tab><tab>", "<cmd>BookmarkToggle<CR>", "Toggle" },
  },
  config = function()
    vim.g.bookmark_auto_save = 1
    -- vim.g.bookmark_manage_per_buffer = 1
    vim.g.bookmark_auto_close = 1
  end,
}
return M
