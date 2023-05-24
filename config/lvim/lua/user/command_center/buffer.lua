local commands = {
  {
    description = "Toggle Buffer Pin",
    cmd = "<CMD>BufferLineTogglePin<CR>",
    keybindings = { "n", "<Leader>bt" },
    category = "Buffer",
  },
  {
    description = "Next Buffer",
    cmd = "<cmd>:bnext<cr>",
    keybindings = { "n", "<leader>bn" },
    category = "Buffer",
  },
  {
    description = "First Buffer",
    cmd = "<cmd>:bfirst<cr>",
    keybindings = { "n", "<leader>b1" },
    category = "Buffer",
  },
  {
    description = "Last Buffer",
    cmd = "<cmd>:blast<cr>",
    keybindings = { "n", "<leader>b0" },
    category = "Buffer",
  },
  {
    description = "Save File",
    cmd = "<CMD>w <CR>",
    keybindings = { "n", "<C-s>" },
    category = "File",
  },
  {
    description = "Buffer Last Used",
    cmd = "<plug>(CybuLastusedNext)<CR>",
    keybindings = { "n", "<M-tab>" },
    category = "Buffer",
  },
  {
    description = "Buffer Previous Used",
    cmd = "<plug>(CybuLastusedNext)<CR>",
    keybindings = { "n", "<M-s-tab>" },
    category = "Buffer",
  },
  {
    description = "Buffer Next",
    cmd = "<CMD>CybuNext<CR>",
    keybindings = {
      { "n", "<S-l>" },
    },
    category = "Buffer",
  },
  {
    description = "Buffer Previous",
    cmd = "<CMD>CybuPrev<CR>",
    keybindings = {
      { "n", "<S-h>" },
    },
    category = "Buffer",
  },
  {
    description = "Buffer Delete",
    cmd = "<CMD>bdelete<CR>",
    keybindings = { "n", "<C-M-w>" },
    category = "Buffer",
  },
  {
    description = "Tab Close",
    cmd = "<CMD>tabclose<CR>",
    keybindings = { "n", "<M-q>" },
    category = "Window",
  }
};

return commands
