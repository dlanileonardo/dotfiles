local M = {
  enabled = true,
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  opts = {
    keymaps = {
      normal = "sa",
      delete = "sd",
      change = "sr",
    },
  },
}
return M
