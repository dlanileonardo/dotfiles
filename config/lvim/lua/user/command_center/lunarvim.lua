local commands = {
  {
    desc = "Structural Search and Replace",
    cmd = "<CMD>lua require(\"ssr\").open()<CR>",
    keys = {
      { "n", "<M-f>" },
      { "x", "<M-f>" },
    },
    cat = "LunarVim",
  },
  {
    desc = "Move to down",
    cmd = "<CMD>m .+1<CR>==",
    keys = {
      { "n", "<C-M-j>" },
      { "n", "<S-Down>" },
    },
    cat = "LunarVim",
  },
  {
    desc = "Move to up",
    cmd = "<CMD>m .-2<CR>==",
    keys = {
      { "n", "<C-M-k>" },
      { "n", "<S-Up>" },
    },
    cat = "LunarVim",
  },
  {
    desc = "Check Health",
    cmd = "<cmd>:CheckHealth<cr>",
    keys = { "n", "<leader>Lh" },
    cat = "LunarVim",
  },
  {
    desc = "Update Core Packages",
    cmd = "<CMD>LvimSyncCorePlugins<CR>",
    cat = "LunarVim",
  },
  {
    desc = "Update Plugins",
    cmd = "<cmd>lua require(\"lazy\").update()<cr>",
    cat = "LunarVim",
  },
  {
    desc = "Sync Plugins",
    cmd = "<cmd>lua require(\"lazy\").sync()<cr>",
    cat = "LunarVim",
  },
  {
    desc = "Toggle NvimTree",
    cmd = "<CMD>NvimTreeToggle<CR>",
    -- keys = { "n", "<M-b>" },
    cat = "LunarVim",
  },
  {
    desc = "NvimTree - Find File",
    cmd = "<CMD>NvimTreeFindFile<CR>",
    cat = "LunarVim",
  },
  {
    desc = "Update LunarVim",
    cmd = "<CMD>LvimUpdate<CR>",
    cat = "LunarVim",
  },
  {
    desc = "Toggle Auto Format",
    cmd = "<CMD>LvimToggleFormatOnSave<CR>",
    cat = "LunarVim",
  },
  {
    desc = "Reload LunarVim's configuration",
    cmd = "<cmd>LvimReload<cr>",
    cat = "LunarVim",
  },
  {
    desc = "Open Config File",
    cmd = "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>",
    cat = "LunarVim",
  },
};
return commands;
