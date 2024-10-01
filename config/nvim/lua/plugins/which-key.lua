local icons = require "plugins.utils.icons"

local M = {
  "folke/which-key.nvim",
  -- commit = "0539da005b98b02cf730c1d9da82b8e8edb1c2d2",
  opts = {
    win = {
      no_overlap = false,
    },
    plugins = { spelling = true },
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>d", group = "debug" },
        { "<leader>t", group = "trouble", icon = { icon = icons.diagnostics.BoldWarning, color = "red" } },
        { "<leader>y", group = "tests" },
        { "<leader>m", group = "minimap" },
      },
    },
  },
}

return M
