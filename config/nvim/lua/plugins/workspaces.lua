local M = {
  enabled = true,
  "natecraddock/workspaces.nvim",
  opts = {
    auto_open = false,
    -- path = vim.fn.stdpath("data") .. "/workspaces",
    hooks = {
      open_pre = { "SessionSave", "bufdo bd" },
      open = { "SessionRestore" }
    },
  },
}
return M
