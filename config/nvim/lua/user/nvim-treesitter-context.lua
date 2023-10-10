local M = {
  enabled = true,
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufRead",
  opts = {
    enable = true,
    throttle = true,
    max_lines = 0,
    mode = "topline",
    patterns = {
      default = {
        "class",
        "function",
        "method",
        "for",
        "while",
        "if",
        "switch",
        "case",
      },
    },
    -- on_attach = function(buf)
    --   return vim.bo[buf].filetype ~= "html"
    -- end,
  },
}
return M
