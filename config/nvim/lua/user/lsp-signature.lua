local M = {
  enabled = true,
  "ray-x/lsp_signature.nvim",
  lazy = true,
  event = "BufRead",
  opts = {
    hint = false,
  },
}
return M
