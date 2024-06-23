local M = {
  enabled = true,
  "ckolkey/ts-node-action",
  lazy = false,
  keys = {
    {
      "gT",
      function() require("ts-node-action").node_action() end,
      desc = "Node Action",
    },
    {
      "<leader>cT", function() require("ts-node-action").node_action() end,
      desc = "Node Action",
    },
  },
  dependencies = { "nvim-treesitter" },
  opts = {},
}
return M
