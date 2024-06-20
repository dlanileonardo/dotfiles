local M = {
  enabled = true,
  "ckolkey/ts-node-action",
  lazy = false,
  keys = {
    {
      "T",
      function()
        require("ts-node-action").node_action()
      end,
      desc = "Node Action",
    },
    {
      "<leader>TT",
      function()
        require("ts-node-action").node_action()
      end,
      desc = "Node Action",
    },
  },
  dependencies = { "nvim-treesitter" },
  opts = {},
}
return M
