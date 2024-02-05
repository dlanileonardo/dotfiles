local M = {
  enabled = true,
  "gbprod/yanky.nvim",
  lazy = true,
  keys = {
    { "p",  "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
    { "P",  "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
    { "gp",  "<Plug>(YankyGPutAfter)", mode = { "n", "x" } },
    { "gP",  "<Plug>(YankyGPutBefore)", mode = { "n", "x" } },
    { "<M-,>",  "<Plug>(YankyCycleForward)", mode = { "n" } },
    { "<M-.>",  "<Plug>(YankyCycleBackward)", mode = { "n" } },
  },
  dependencies = {
    {
      "kkharji/sqlite.lua",
      enabled = false,
    }
  },
  opts = {
    ring = {
      storage = "shada",
    },
    system_clipboard = {
      sync_with_ring = true,
    },
    highlight = {
      on_put = false,
      on_yank = false,
    }
  },
  -- config = function()
  --   require("yanky").setup {}
  --   -- vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
  --   -- vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
  --   -- vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
  --   -- vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
  --   -- vim.keymap.set("n", "<M-,>", "<Plug>(YankyCycleForward)")
  --   -- vim.keymap.set("n", "<M-.>", "<Plug>(YankyCycleBackward)")
  -- end,
}
return M
