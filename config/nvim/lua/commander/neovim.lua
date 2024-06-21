local commands = {
  {
    desc = "Structural Search and Replace",
    cmd = "<CMD>lua require(\"ssr\").open()<CR>",
    keys = {
      { "n", "<M-f>" },
      { "x", "<M-f>" },
    },
    cat = "NeoVim",
  },
  {
    desc = "Move to down",
    cmd = "<CMD>m .+1<CR>==",
    keys = {
      { "n", "<C-M-j>" },
      { "n", "<S-Down>" },
    },
    cat = "NeoVim",
  },
  {
    desc = "Move to up",
    cmd = "<CMD>m .-2<CR>==",
    keys = {
      { "n", "<C-M-k>" },
      { "n", "<S-Up>" },
    },
    cat = "NeoVim",
  },
  {
    desc = "Check Health",
    cmd = "<cmd>:CheckHealth<cr>",
    keys = { "n", "<leader>Lh" },
    cat = "NeoVim",
  },
  {
    desc = "Update Plugins",
    cmd = "<cmd>lua require(\"lazy\").update()<cr>",
    cat = "NeoVim",
  },
  {
    desc = "Sync Plugins",
    cmd = "<cmd>lua require(\"lazy\").sync()<cr>",
    cat = "NeoVim",
  },
  {
    desc = "Toggle Terminal",
    cmd = "<CMD>ToggleTerm<CR>",
    cat = "Terminal",
  },
};
return commands;
