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
    -- lvim.builtin.which_key.mappings["B"] = {
    --   name = "Bookmarks",
    --   t = { "<cmd>BookmarkToggle<CR>", "Toggle" },
    --   i = { "<cmd>BookmarkAnnotate<CR>", "Annotate" },
    --   a = { "<cmd>BookmarkShowAll<CR>", "Show All" },
    --   j = { "<cmd>BookmarkNext<CR>", "Next" },
    --   k = { "<cmd>BookmarkPrev<CR>", "Previous" },
    --   c = { "<cmd>BookmarkClear<CR>", "Clear" },
    --   x = { "<cmd>BookmarkClearAll<CR>", "Clear All" },
    --   g = { "<cmd>BookmarkMoveToLine<CR>", "Move to Line" },
    --   -- { "<leader>Bjj", "<cmd>BookmarkMoveDown<CR>",   desc = "Move Down" },
    --   -- { "<leader>Bkk", "<cmd>BookmarkMoveUp<CR>",     desc = "Move Up" },
    -- }
    -- vim.g.bookmark_auto_save = 1
    -- vim.g.bookmark_manage_per_buffer = 1
    vim.g.bookmark_auto_close = 1
  end,
}
return M
