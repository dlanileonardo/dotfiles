local M = {
  enabled = false,
  "kylechui/nvim-surround",
  version = "*",
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
