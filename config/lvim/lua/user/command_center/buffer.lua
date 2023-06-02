local commands = {
  -- {
  --   description = "Toggle Buffer Group Toggle",
  --   cmd = "<cmd>BufferLIneGroupToggle",
  --   -- keybindings = { "n", "<Leader>bt" },
  --   category = "Buffer",
  -- },
  -- {
  --   description = "Toggle Buffer Group Close",
  --   cmd = "<cmd>BufferLineGroupClose",
  --   -- keybindings = { "n", "<Leader>bt" },
  --   category = "Buffer",
  -- },
  {
    description = "Toggle Buffer Pin",
    cmd = "<cmd>BufferLineTogglePin<cr>",
    keybindings = { "n", "<Leader>bt" },
    category = "Buffer",
  },
  {
    description = "Buffer Pick",
    cmd = "<cmd>BufferLinePick<cr>",
    keybindings = { "n", "fb" },
    category = "Buffer",
  },
  {
    description = "Next Buffer",
    cmd = "<cmd>bnext<cr>",
    keybindings = { "n", "<leader>bn" },
    category = "Buffer",
  },
  {
    description = "First Buffer",
    cmd = "<cmd>bfirst<cr>",
    keybindings = { "n", "<leader>b1" },
    category = "Buffer",
  },
  {
    description = "Last Buffer",
    cmd = "<cmd>blast<cr>",
    keybindings = { "n", "<leader>b0" },
    category = "Buffer",
  },
  {
    description = "Save File",
    cmd = "<CMD>w<CR>",
    keybindings = { "n", "<C-s>" },
    category = "File",
  },
  {
    description = "Buffer Last Used",
    cmd = "<plug>(CybuLastusedNext)<cr>",
    keybindings = { "n", "<M-tab>" },
    category = "Buffer",
  },
  {
    description = "Buffer Previous Used",
    cmd = "<plug>(CybuLastusedNext)<cr>",
    keybindings = { "n", "<M-s-tab>" },
    category = "Buffer",
  },
  {
    description = "Buffer Next",
    cmd = "<cmd>BufferLineCycleNext<cr>",
    keybindings = {
      { "n", "<S-l>" },
    },
    category = "Buffer",
  },
  {
    description = "Buffer Previous",
    cmd = "<cmd>BufferLineCyclePrev<cr>",
    keybindings = {
      { "n", "<S-h>" },
    },
    category = "Buffer",
  },
  {
    description = "Buffer Delete",
    cmd = "<cmd>Bdelete<cr>",
    keybindings = { "n", "<C-M-w>" },
    category = "Buffer",
  },
  {
    description = "Tab Close",
    cmd = "<cmd>tabclose<cr>",
    keybindings = { "n", "<M-q>" },
    category = "Window",
  }
};

return commands
