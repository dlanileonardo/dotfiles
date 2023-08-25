local M = {
  enabled = true,
  'ckolkey/ts-node-action',
  lazy = true,
  keys = {
    { "T", "<CMD>lua require('ts-node-action').node_action()<CR>", desc = "Node Action" },
  },
  dependencies = { 'nvim-treesitter' },
  opts = {}
}
return M
