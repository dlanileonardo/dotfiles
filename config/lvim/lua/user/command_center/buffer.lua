local commands = {
  -- {
  --   description = "Toggle Buffer Group Toggle",
  --   cmd = "<cmd>BufferLIneGroupToggle",
  --   -- keys = { "n", "<Leader>bt" },
  --   category = "Buffer",
  -- },
  -- {
  --   description = "Toggle Buffer Group Close",
  --   cmd = "<cmd>BufferLineGroupClose",
  --   -- keys = { "n", "<Leader>bt" },
  --   category = "Buffer",
  -- },
  {
    description = "Toggle Buffer Pin",
    cmd = "<cmd>BufferLineTogglePin<cr>",
    keys = { "n", "<Leader>bt" },
    category = "Buffer",
  },
  {
    description = "Buffer Pick",
    cmd = "<cmd>BufferLinePick<cr>",
    keys = { "n", "fb" },
    category = "Buffer",
  },
  {
    description = "Next Buffer",
    cmd = "<cmd>bnext<cr>",
    keys = { "n", "<leader>bn" },
    category = "Buffer",
  },
  {
    description = "First Buffer",
    cmd = "<cmd>bfirst<cr>",
    keys = { "n", "<leader>b1" },
    category = "Buffer",
  },
  {
    description = "Last Buffer",
    cmd = "<cmd>blast<cr>",
    keys = { "n", "<leader>b0" },
    category = "Buffer",
  },
  {
    description = "Save File",
    cmd = "<CMD>w<CR>",
    keys = { "n", "<C-s>" },
    category = "File",
  },
  {
    description = "Buffer Last Used",
    cmd = "<plug>(CybuLastusedNext)<cr>",
    keys = { "n", "<M-tab>" },
    category = "Buffer",
  },
  {
    description = "Buffer Previous Used",
    cmd = "<plug>(CybuLastusedNext)<cr>",
    keys = { "n", "<M-s-tab>" },
    category = "Buffer",
  },
  {
    description = "Buffer Next",
    cmd = "<cmd>BufferLineCycleNext<cr>",
    keys = {
      { "n", "<S-l>" },
    },
    category = "Buffer",
  },
  {
    description = "Buffer Previous",
    cmd = "<cmd>BufferLineCyclePrev<cr>",
    keys = {
      { "n", "<S-h>" },
    },
    category = "Buffer",
  },
  {
    description = "Buffer Delete",
    cmd = "<cmd>Bdelete<cr>",
    keys = { "n", "<C-M-w>" },
    category = "Buffer",
  },
  {
    description = "Tab Close",
    cmd = "<cmd>tabclose<cr>",
    keys = { "n", "<M-q>" },
    category = "Buffer",
  },
  {
    description = "Highlight Args",
    cmd = "<CMD>lua require('hlargs').toggle()<CR>",
    category = "Buffer",
  }
};

return commands
