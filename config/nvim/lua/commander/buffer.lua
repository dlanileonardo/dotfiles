local commands = {
  -- {
  --   desc = "Toggle Buffer Group Toggle",
  --   cmd = "<cmd>BufferLIneGroupToggle",
  --   -- keys = { "n", "<Leader>bt" },
  --   cat = "Buffer",
  -- },
  -- {
  --   desc = "Toggle Buffer Group Close",
  --   cmd = "<cmd>BufferLineGroupClose",
  --   -- keys = { "n", "<Leader>bt" },
  --   cat = "Buffer",
  -- },
  {
    desc = "Toggle Buffer Pin",
    cmd = "<cmd>BufferLineTogglePin<cr>",
    keys = { "n", "<Leader>bt" },
    cat = "Buffer",
  },
  {
    desc = "Buffer Pick",
    cmd = "<cmd>BufferLinePick<cr>",
    keys = { "n", "fb" },
    cat = "Buffer",
  },
  {
    desc = "Next Buffer",
    cmd = "<cmd>bnext<cr>",
    keys = { "n", "<leader>bn" },
    cat = "Buffer",
  },
  {
    desc = "First Buffer",
    cmd = "<cmd>bfirst<cr>",
    keys = { "n", "<leader>b1" },
    cat = "Buffer",
  },
  {
    desc = "Last Buffer",
    cmd = "<cmd>blast<cr>",
    keys = { "n", "<leader>b0" },
    cat = "Buffer",
  },
  {
    desc = "Save File",
    cmd = "<CMD>w<CR>",
    keys = { "n", "<C-s>" },
    cat = "File",
  },
  {
    desc = "Buffer Last Used",
    cmd = "<plug>(CybuLastusedNext)<cr>",
    keys = { "n", "<M-tab>" },
    cat = "Buffer",
  },
  {
    desc = "Buffer Previous Used",
    cmd = "<plug>(CybuLastusedNext)<cr>",
    keys = { "n", "<M-s-tab>" },
    cat = "Buffer",
  },
  {
    desc = "Buffer Next",
    cmd = "<cmd>BufferLineCycleNext<cr>",
    keys = {
      { "n", "<S-l>" },
    },
    cat = "Buffer",
  },
  {
    desc = "Buffer Previous",
    cmd = "<cmd>BufferLineCyclePrev<cr>",
    keys = {
      { "n", "<S-h>" },
    },
    cat = "Buffer",
  },
  {
    desc = "Buffer Delete",
    cmd = "<cmd>Bdelete<cr>",
    keys = { "n", "<C-M-w>" },
    cat = "Buffer",
  },
  {
    desc = "Tab Close",
    cmd = "<cmd>tabclose<cr>",
    keys = { "n", "<M-q>" },
    cat = "Buffer",
  },
  {
    desc = "Highlight Args",
    cmd = "<CMD>lua require('hlargs').toggle()<CR>",
    cat = "Buffer",
  }
};

return commands
