local M = {
  enabled = false,
  "ray-x/lsp_signature.nvim",
  lazy = true,
  event = "BufRead",
  opts = {
    hint = false,
  },
}
return M
