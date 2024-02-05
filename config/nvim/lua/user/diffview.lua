local M =   {
  enabled = true,
  "sindrets/diffview.nvim",
  lazy = true,
  -- event = "BufRead",
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose", },
  dependencies = 'nvim-lua/plenary.nvim'
}
return M
